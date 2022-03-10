//
//  game.swift
//  HRD
//
//  Created by 张金涛 on 2022/2/16.
//

import Foundation
enum Direction{
    case left
    case right
    case up
    case down
}
class Game{
    
    var arr=[[Int]](repeating: [0,0,0,0], count: 5)
    
    var personArr=[Person]()
    func createPerson(name:String,location:Location,length:Int,width:Int){
        let person=Person(name: name,location: location,length: length,width: width)
        personArr.append(person)
    }
    //返回某点的人物
    func fillArr(person:Person){
        for wid in 0..<person.width{
            for len in 0..<person.length{
                arr[person.location.row+wid][person.location.line+len]=1
            }
        }
    }
    func removeArr(person:Person){
        for wid in 0..<person.width{
            for len in 0..<person.length{
                arr[person.location.row+wid][person.location.line+len]=0
            }
        }
    }
    func returnPersonWithLocation(location:Location)->Int{
        for index in 0..<10{
            if personArr[index].location.line==location.line&&personArr[index].location.row==location.row{
                return index
            }
        }
        return -1
    }
    func personToutch(index:Int)->Bool{
        print("index\(index)")
        let person=personArr[index]
        let location=personArr[index].location
        if location.line<0 || location.row<0 || location.row+personArr[index].width>5 || location.line+personArr[index].length>4{
            return true
        }
        for wid in 0..<person.width{
            for len in 0..<person.length{
                if arr[person.location.row+wid][person.location.line+len]==1{
                    return true
                }
            }
        }
        return false
        
    }
    

 func movePerson(location:Location,direction:Direction,completion:(_ actions:[Action])->Void){
    let index = returnPersonWithLocation(location: location)
     //print(index)
    // print(personArr[index].location)
     //print(location)
     var actionArr=[Action]()
    if index == -1{
        actionArr.append(Action.nothing)
        completion(actionArr)
        return
    }
    if direction == .left{
        //print(personArr[index].location)
        
        removeArr(person: personArr[index])
        personArr[index].location.line -= 1
        //print(personArr[index].location)
        if personToutch(index: index){
            
            personArr[index].location.line+=1
            fillArr(person: personArr[index])
        }else{
            
            fillArr(person: personArr[index])
            actionArr.append(Action.move(from: location, to: personArr[index].location))
        }
    }
    if direction == .right{
        removeArr(person: personArr[index])
        personArr[index].location.line += 1
        if personToutch(index: index){
            personArr[index].location.line-=1
            fillArr(person: personArr[index])
        }else{
            fillArr(person: personArr[index])
            actionArr.append(Action.move(from: location, to: personArr[index].location))
        }
    }
    if direction == .up{
        removeArr(person: personArr[index])
        personArr[index].location.row -= 1
        if personToutch(index: index){
            personArr[index].location.row+=1
            fillArr(person: personArr[index])
        }else{
            fillArr(person: personArr[index])
            actionArr.append(Action.move(from: location, to: personArr[index].location))
        }
    }
    if direction == .down{
        removeArr(person: personArr[index])
        
        personArr[index].location.row += 1
        if personToutch(index: index){
            personArr[index].location.row-=1
            fillArr(person: personArr[index])
        }else{
            fillArr(person: personArr[index])
            actionArr.append(Action.move(from: location, to: personArr[index].location))
        }
    }
     if personArr[index].name=="cao"&&personArr[index].location.row==3&&personArr[index].location.line==1{
         actionArr.append(Action.success)
     }
     completion(actionArr)
     print(actionArr)
 }
    
    func gameEnd(){
        
    }
}


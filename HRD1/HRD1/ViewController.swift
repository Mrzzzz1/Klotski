//
//  ViewController.swift
//  HRD1
//
//  Created by 张金涛 on 2022/2/17.
//

import UIKit
struct person9{let name:String
    let location:Location
    let width:Float
    let height:Float
}


class ViewController: UIViewController ,gameViewDelegate,successViewDelegate{
    func playAgain() {
        //
    }
    
    func showSuccessView() {
        successView.setUpView()
        
    }
    //横刀立马
    lazy var personArr2d=[[person9]](arrayLiteral: personArr,personArr2,personArr3,personArr4,personArr5)
    
     lazy var personArr=[person9](arrayLiteral: person9(name: "ma1", location: Location(row: 0, line: 0), width: 1, height: 2),person9(name: "cao", location: Location(row: 0, line: 1), width: 2, height: 2),person9(name: "zhao1", location: Location(row: 0, line: 3), width: 1, height: 2),person9(name: "huang1", location: Location(row: 2, line: 0), width:1 , height: 2),person9(name: "guan", location: Location(row: 2, line: 1), width: 2, height: 1),person9(name: "zhang1", location: Location(row: 2, line: 3), width: 1, height: 2),person9(name: "bing1", location: Location(row: 4, line: 0), width: 1, height: 1),person9(name: "bing2", location: Location(row: 3, line: 1), width: 1, height: 1),person9(name: "bing3", location: Location(row: 3, line: 2), width: 1, height: 1),person9(name: "bing4", location: Location(row: 4, line: 3), width: 1, height: 1))
    //指挥若定
    lazy var personArr2=[person9](arrayLiteral: person9(name: "ma1", location: Location(row: 0, line: 0), width: 1, height: 2),person9(name: "cao", location: Location(row: 0, line: 1), width: 2, height: 2),person9(name: "zhao1", location: Location(row: 0, line: 3), width: 1, height: 2),person9(name: "huang1", location: Location(row: 3, line: 0), width:1 , height: 2),person9(name: "guan", location: Location(row: 2, line: 1), width: 2, height: 1),person9(name: "zhang1", location: Location(row: 3, line: 3), width: 1, height: 2),person9(name: "bing1", location: Location(row: 2, line: 0), width: 1, height: 1),person9(name: "bing2", location: Location(row: 3, line: 1), width: 1, height: 1),person9(name: "bing3", location: Location(row: 3, line: 2), width: 1, height: 1),person9(name: "bing4", location: Location(row: 2, line: 3), width: 1, height: 1))
    //将拥曹营
    lazy var personArr3=[person9](arrayLiteral: person9(name: "ma1", location: Location(row: 1, line: 0), width: 1, height: 2),person9(name: "cao", location: Location(row: 0, line: 1), width: 2, height: 2),person9(name: "zhao1", location: Location(row: 1, line: 3), width: 1, height: 2),person9(name: "huang1", location: Location(row: 2, line: 1), width:1 , height: 2),person9(name: "guan", location: Location(row: 4, line: 0), width: 2, height: 1),person9(name: "zhang1", location: Location(row: 2, line: 2), width: 1, height: 2),person9(name: "bing1", location: Location(row: 3, line: 0), width: 1, height: 1),person9(name: "bing2", location: Location(row: 3, line: 3), width: 1, height: 1),person9(name: "bing3", location: Location(row: 4, line: 2), width: 1, height: 1),person9(name: "bing4", location: Location(row: 4, line: 3), width: 1, height: 1))
    //齐头并进
    lazy var personArr4=[person9](arrayLiteral: person9(name: "ma1", location: Location(row: 0, line: 0), width: 1, height: 2),person9(name: "cao", location: Location(row: 0, line: 1), width: 2, height: 2),person9(name: "zhao1", location: Location(row: 0, line: 3), width: 1, height: 2),person9(name: "huang1", location: Location(row: 3, line: 0), width:1 , height: 2),person9(name: "guan", location: Location(row: 3, line: 1), width: 2, height: 1),person9(name: "zhang1", location: Location(row: 3, line: 3), width: 1, height: 2),person9(name: "bing1", location: Location(row: 2, line: 0), width: 1, height: 1),person9(name: "bing2", location: Location(row: 2, line: 1), width: 1, height: 1),person9(name: "bing3", location: Location(row: 2, line: 2), width: 1, height: 1),person9(name: "bing4", location: Location(row: 2, line: 3), width: 1, height: 1))
    //兵分三路
    lazy var personArr5=[person9](arrayLiteral: person9(name: "ma1", location: Location(row: 1, line: 0), width: 1, height: 2),person9(name: "cao", location: Location(row: 0, line: 1), width: 2, height: 2),person9(name: "zhao1", location: Location(row: 1, line: 3), width: 1, height: 2),person9(name: "huang1", location: Location(row: 3, line: 0), width:1 , height: 2),person9(name: "guan", location: Location(row: 2, line: 1), width: 2, height: 1),person9(name: "zhang1", location: Location(row: 3, line: 3), width: 1, height: 2),person9(name: "bing1", location: Location(row: 0, line: 0), width: 1, height: 1),person9(name: "bing2", location: Location(row: 3, line: 1), width: 1, height: 1),person9(name: "bing3", location: Location(row: 3, line: 2), width: 1, height: 1),person9(name: "bing4", location: Location(row: 0, line: 3), width: 1, height: 1))
    
    
    
    func slideEnded(offset: CGPoint,location:CGPoint) {
        let direction:Direction
        
        if offset.y>offset.x{
            if offset.y > -offset.x{
                direction = .up
            }
            else {
                direction = .right}
        }
        else {
            if offset.y > -offset.x{
                direction = .left
            }else{
                direction = .down           }
        }
        print(direction)
        gameView.getPersonLocation(location: location)
        //print(gameView.personLocation)
        if gameView.personLocation.line>=0&&gameView.personLocation.row>=0{
            game.movePerson(location: gameView.personLocation, direction: direction){
                        (action) in gameView.performActions(action)
                    }
            gameView.personLocation=Location(row: -1, line: -1)
            
            print(game.arr)
        }else{print("no")}
        
    }
    private lazy var game=Game()
     lazy var gameView=GameView()
    lazy var successView=SuccessView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(gameView)
        gameView.setUpView()
        gameView.delegate=self
        start()
        
    }
    func start(){
        for index in 0..<10{
            setPerson(name: personArr[index].name, location: personArr[index].location, width: personArr[index].width, height: personArr[index].height)
           // print(personArr[index])
        }
        
    }
    func setPerson(name:String,location:Location,width:Float,height:Float){
        let person1=Person(name: name, location: location, length: Int(width), width: Int(height))
        game.personArr.append(person1)
        game.fillArr(person: person1)
        let personView1=PersonView(frame: gameView.getRectOf(row: location.row, line: location.line, width: CGFloat(width), heigh: CGFloat(height)), name: name)
        personView1.tag=gameView.tag(at: location)
        gameView.addSubview(personView1)
        personView1.createAnimation()
        gameView.personViewArr.append(personView1)
  //      print(CGFloat(width))
   //     print(CGFloat(height))
//        print(person1)
//        print(personView1.frame)
//        print(personView1.name)
//        print(personView1.width)
//        print(personView1.height)
        
    }


}


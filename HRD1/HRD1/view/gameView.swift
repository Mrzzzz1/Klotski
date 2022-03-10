//
//  gameView.swift
//  HRD1
//
//  Created by 张金涛 on 2022/2/17.
//

import SwiftUI
protocol gameViewDelegate{
    func slideEnded(offset:CGPoint,location:CGPoint)
    func showSuccessView()
    
}

class GameView:UIView,UIGestureRecognizerDelegate{
    
    var personViewArr=[PersonView]()
    var delegate:gameViewDelegate?=nil
    var personLocation=Location(row: -1, line: -1)
    private var startLocation = CGPoint()
    private var touchingDetectable = true
    
    var size=4
    private var drawBound:CGRect{
        let bound = self.bounds
        //print(self.bounds)
        return bound
    }
    private var boundSize:CGFloat{
        let viewWidth=drawBound.size.width
        //print(viewWidth)
        return 390.0/CGFloat(size)
        
    }

     func getRectOf(row:Int,line:Int,width:CGFloat,heigh:CGFloat)->CGRect{
        var location=CGPoint(x: CGFloat(line)*boundSize, y: CGFloat(row)*boundSize)
        location.x+=drawBound.origin.x
        location.y+=drawBound.origin.y
        // print(boundSize)
        return CGRect(origin: location, size: CGSize(width: width*boundSize, height: heigh*boundSize))
         
    }
    
    func setUpView(){
        self.backgroundColor = .clear
        guard let superV=superview else {return}
        self.translatesAutoresizingMaskIntoConstraints=false
        self.centerXAnchor.constraint(equalTo: superV.centerXAnchor).isActive=true
        self.centerYAnchor.constraint(equalTo: superV.centerYAnchor).isActive=true
        self.widthAnchor.constraint(equalTo: superV.widthAnchor).isActive=true
        self.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.25).isActive=true
       // print(self.widthAnchor)
    }
     func tag(at position:Location)->Int
        {
            return (1+position.row)*100+position.line
        }
       // tag->card
    
    private func getPersonView(at position:Location)->PersonView?{
            return viewWithTag(tag(at: position)) as? PersonView
        }
    private func moveCard(from: Location, to:Location){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.06*Double(max(abs(from.row-to.row), abs(from.line-to.line))), delay: 0.0, options: [], animations:{
            if let cardView=self.getPersonView(at: from){
                cardView.frame=self.getRectOf(row: to.row, line: to.line, width: cardView.width/self.boundSize, heigh: cardView.height/self.boundSize)
                cardView.tag=self.tag(at: to)
                cardView.upLocation=CGPoint(x: cardView.frame.origin.x, y: cardView.frame.origin.y)
                cardView.downLocation=CGPoint(x: cardView.upLocation.x+cardView.frame.width, y: cardView.upLocation.y+cardView.frame.height)
            }
        })
            
        }
    func getPersonLocation(location:CGPoint){
        for personView in personViewArr{
            if location.x>=personView.upLocation.x&&location.x<=personView.downLocation.x&&location.y>=personView.upLocation.y&&location.y<=personView.downLocation.y{
                self.personLocation.row=Int(personView.upLocation.y/boundSize)
                self.personLocation.line=Int(personView.upLocation.x/boundSize)
                return
            }
            
        }
    }
    func performActions(_ actions:[Action]){
       // print("1")
        //print(actions)
        for action in actions {
            print("2")
            switch action{
            
            case .move(from: let from, to: let to):
                moveCard(from: from, to: to)
            
            case .success: break
                delegate?.showSuccessView()
            
            case .nothing: break
                //
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let touch=touches.first{
            startLocation=touch.preciseLocation(in: self)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !touchingDetectable{return}
        if let touch=touches.first{
            let endLocation=touch.preciseLocation(in: self)
            if distance(between: startLocation, and: endLocation)>50{
                touchingDetectable=false
                let offset=CGPoint(x: startLocation.x-endLocation.x, y: startLocation.y-endLocation.y)
                
                delegate?.slideEnded(offset: offset,location: startLocation)
                
                
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if touchingDetectable{
            
            if let touch=touches.first{
                let endLocation=touch.preciseLocation(in: self)
                let offset=CGPoint(x: startLocation.x-endLocation.x, y: startLocation.y-endLocation.y)
                if abs(offset.x)>5||abs(offset.y)>5{
                    delegate?.slideEnded(offset: offset,location: startLocation)
                }
            }
        }
        else {
            touchingDetectable=true
        }
        
    }
   //两点间距离
    func distance(between pointA:CGPoint,and pointB:CGPoint)->Double{
        return sqrt(Double((pointA.x-pointB.x)*(pointA.x-pointB.x)+(pointA.y-pointB.y)*(pointA.y-pointB.y)))
    }
    
    
}

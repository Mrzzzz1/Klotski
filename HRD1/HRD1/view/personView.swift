//
//  personView.swift
//  HRD1
//
//  Created by 张金涛 on 2022/2/17.
//

import SwiftUI

class PersonView:UIView{
    var image=UIImage()
    var view=UIImageView()
    var width:CGFloat=0
    var height:CGFloat=0
    var upLocation=CGPoint()
    var downLocation=CGPoint()
    var name=""
    init(frame:CGRect,name:String) {
       super.init(frame: frame)
       self.frame=frame
        self.backgroundColor = .blue
        self.width=frame.width
        self.height=frame.height
        self.upLocation=CGPoint(x: frame.origin.x, y: frame.origin.y)
        self.downLocation=CGPoint(x: upLocation.x+frame.width, y: upLocation.y+frame.height)
        self.name="\(name).png"
        print(self.name)
        self.image=UIImage(named: self.name)!
        view.image=image
        self.addSubview(view)
        self.set()
 }
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    func set(){
        view.translatesAutoresizingMaskIntoConstraints=false
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive=true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive=true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive=true
        
    }
    func createAnimation(){
        transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1)
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0.0, options: [],
                                                       animations: {
            self.transform = .identity
            
        })
    }
}

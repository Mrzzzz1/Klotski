//
//  person.swift
//  HRD
//
//  Created by 张金涛 on 2022/2/16.
//

import Foundation
struct Location{
    var row:Int;
    var line:Int;
}
class Person{
    var name:String;
    var location:Location//左上角坐标
    var length:Int
    var width:Int
    init(name:String,location:Location,length:Int,width:Int){
        self.name=name
        self.location=location
        self.length=length
        self.width=width
    }
}

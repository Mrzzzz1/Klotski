//
//  successView.swift
//  HRD1
//
//  Created by 张金涛 on 2022/2/20.
//

import SwiftUI
protocol successViewDelegate{
    
    func playAgain()
}

class SuccessView:UIView{
    var delegate:successViewDelegate?=nil
    let SuccessLabel=UILabel()
    let playAgainButton=UIButton()
    let backButton=UIButton()
    func setUplabel(){
        self.addSubview(SuccessLabel)
        SuccessLabel.backgroundColor = .brown
        SuccessLabel.translatesAutoresizingMaskIntoConstraints=false
        SuccessLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        SuccessLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        SuccessLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive=true
        SuccessLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive=true
        SuccessLabel.text="Congratulations!"
        SuccessLabel.textColor = .red
        
    }
    func setUpButton(){
        self.addSubview(playAgainButton)
        self.addSubview(backButton)
        playAgainButton.translatesAutoresizingMaskIntoConstraints=false
        playAgainButton.topAnchor.constraint(equalTo: SuccessLabel.bottomAnchor).isActive=true
        playAgainButton.trailingAnchor.constraint(equalTo: SuccessLabel.trailingAnchor).isActive=true
        playAgainButton.setTitle("Next part", for: .normal)
        playAgainButton.setTitleColor(.black, for: .normal)
        playAgainButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        
        playAgainButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playAgainButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.translatesAutoresizingMaskIntoConstraints=false
        backButton.topAnchor.constraint(equalTo: SuccessLabel.bottomAnchor).isActive=true
        backButton.leadingAnchor.constraint(equalTo: SuccessLabel.leadingAnchor).isActive=true
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
    }
    
    @objc func playAgain(){
        self.removeFromSuperview()
        delegate?.playAgain()
    }
    @objc func back(){
        self.removeFromSuperview()
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
        setUplabel()
    }
    
    
}

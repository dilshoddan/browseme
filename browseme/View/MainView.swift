//
//  MainView.swift
//  browseme
//
//  Created by Admin on 11/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Stevia

class MainView: UIView {
    
    private var okButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        SetControlDefaults()
        render()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetControlDefaults(){
        self.backgroundColor = .white
        okButton = UIButton()
        okButton.setTitle("OK", for: .normal)
        okButton.backgroundColor = #colorLiteral(red: 0.5496927479, green: 0.3474869049, blue: 1, alpha: 1)
        
    }
    func render(){
        self.sv(okButton)
        okButton.height(10%).width(30%).centerHorizontally().centerVertically()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  NotificationsView.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Stevia
import Hero

class NotificationsView: UIView {

//    private var segmentedControl: UISegmentedControl!
//    public var webView: WKWebView!
    public var textField: UITextField!
    public var shouldSetupConstraints = true
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        shouldSetupConstraints = true
        SetControlDefaults()
        updateConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetControlDefaults(){
        self.backgroundColor = .white
        
        textField = UITextField()
        
    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([textField])
            textField.height(10%).width(80%).centerHorizontally().centerVertically()
            
        }
        super.updateConstraints()
    }
}

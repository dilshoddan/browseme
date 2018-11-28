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
    public var label: UILabel!
    public var textField: UITextField!
    public var shouldSetupConstraints: Bool!
    
    
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
        
        label = UILabel()
        label.text = "Data:"
        textField = UITextField()
        textField.text = "Placeholder"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.isEnabled = true
        textField.isUserInteractionEnabled = true
        
        
    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([textField, label])
            label.height(10%).width(80%).centerHorizontally()
            textField.height(10%).width(80%).centerHorizontally()
            self.layout(
                |-label-|,
                |-textField-|
            )
            label.Bottom == self.CenterY
            
        }
        super.updateConstraints()
    }
}

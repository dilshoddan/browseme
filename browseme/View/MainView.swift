//
//  MainView.swift
//  browseme
//
//  Created by Admin on 11/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Stevia
import WebKit
import Hero

class MainView: UIView {
    private var shouldSetupConstraints: Bool!
    public var segmentedControl: UISegmentedControl!
    public var webView: WKWebView!
    public var mainView: MainView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shouldSetupConstraints = true
        SetControlDefaults()
        updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetControlDefaults(){
        
        segmentedControl = UISegmentedControl()
        segmentedControl = UISegmentedControl(items: ["Notifications", "Live Chat"])
        segmentedControl.tintColor = ColorConstants.segmentedColorBackground
        segmentedControl.isMomentary = true
//        segmentedControl.backgroundColor = ColorConstants.segmentedColorBackground
        
        self.backgroundColor = .white
        webView = WKWebView(frame: self.frame)
        webView.allowsBackForwardNavigationGestures = true

    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([webView, segmentedControl])
            webView.height(100%).width(100%).centerHorizontally()
            segmentedControl.height(5%).width(90%).centerHorizontally()
            segmentedControl.Bottom == self.Bottom
            
        }
        super.updateConstraints()
    }

}

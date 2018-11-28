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

class MainView: UIView {
    private var segmentedControl: UISegmentedControl!
    public var webView: WKWebView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetControlDefaults()
        render()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetControlDefaults(){
        self.backgroundColor = .white
        
        segmentedControl = UISegmentedControl(items: ["Reports", "Chat"])
        segmentedControl.tintColor = .black
        
        webView = WKWebView()
        
    }
    func render(){
        self.sv([segmentedControl, webView])
        self.layout(
            50,
            |-webView-|,
            |-segmentedControl-|
        )
        
    }

}

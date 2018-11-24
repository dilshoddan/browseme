//
//  ViewController.swift
//  browseme
//
//  Created by Admin on 11/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    
    private var mainView: UIView!
    private var webView: WKWebView!
    
    override func loadView() {
        mainView = MainView(frame: UIScreen.main.bounds)
        self.view.addSubview(mainView)
        webView = WKWebView()
        //webView.navigationDelegate = self
        mainView = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        SetControllerDefaults()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func SetControllerDefaults(){
        
    }
        


}


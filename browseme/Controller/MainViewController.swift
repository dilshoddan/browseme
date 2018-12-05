//
//  ViewController.swift
//  browseme
//
//  Created by Admin on 11/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit
import Stevia
import Hero


class MainViewController: UIViewController, WKNavigationDelegate {
    private var mainView: MainView!
    private var firebaseWorked: FirebaseWorker!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        SetControllerDefaults()
        render()
        RedirectTo("https://www.apple.com")
    }
    
    func SetFirebaseDefaults(){
        firebaseWorked = FirebaseWorker()
    }
    
    func render(){
        view.sv(mainView)
        mainView.height(100%).width(100%).centerInContainer()
        mainView.updateConstraints()
    }
    
    func SetControllerDefaults(){
        mainView = MainView(frame: view.bounds)
        mainView.webView.navigationDelegate = self
        mainView.segmentedControl.addTarget(self, action: #selector(SegmentedControlValueChanged(selectedControl:)), for: .valueChanged)
        
    }
    
    @objc func SegmentedControlValueChanged(selectedControl: UISegmentedControl){
        switch selectedControl.selectedSegmentIndex {
        case 0:
            let notificationsViewController = NotificationsViewController()
            navigationController?.pushViewController(notificationsViewController, animated: true)
        default:
            break
        }
        
    }
    
    func RedirectTo(_ link: String){
        let url = URL(string: link)!
        mainView.webView.load(URLRequest(url: url))
    }
    
}

//extension MainViewController: UISearchResultsUpdating {
//    // MARK: - UISearchResultsUpdating Delegate
//    func updateSearchResults(for searchController: UISearchController) {
//        // TODO
//    }
//}




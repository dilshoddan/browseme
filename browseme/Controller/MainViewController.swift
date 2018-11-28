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
import FirebaseDatabase


class MainViewController: UIViewController, WKNavigationDelegate {
    
    private var databaseReference: DatabaseReference!
    private var mainView: MainView!
    private var firebaseWorked: FirebaseWorker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetControllerDefaults()
        render()
        firebaseWorked.CreateRecordIntoFirebase(databaseReference)
    }
    
    
    
    func render(){
        view.sv(mainView)
        mainView.height(100%).width(100%).centerInContainer()
        mainView.updateConstraints()
    }
    
    
    func SetControllerDefaults(){
        databaseReference = Database.database().reference()
        mainView = MainView(frame: view.bounds)
        mainView.webView.navigationDelegate = self
        RedirectTo("https://www.greenmatch.ru")
        
        mainView.segmentedControl.addTarget(self, action: #selector(SegmentedControlValueChanged(segment:)), for: .valueChanged)
        
        firebaseWorked = FirebaseWorker()
    }
    
    @objc func SegmentedControlValueChanged(segment: UISegmentedControl){
        switch segment.selectedSegmentIndex {
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

extension MainViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}




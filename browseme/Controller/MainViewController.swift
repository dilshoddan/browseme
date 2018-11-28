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


class MainViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
    private var databaseReference: DatabaseReference!
    private var segmentedControl: UISegmentedControl!
    private var webView: WKWebView!
    private var searchController: UISearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetControllerDefaults()
        render()
        CreateRecordIntoFirebase()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func CreateRecordIntoFirebase(){
        databaseReference = Database.database().reference()
        databaseReference.child("name").childByAutoId().setValue("Nigel")
        databaseReference.child("name").childByAutoId().setValue("Richard")
    }
    
    func render(){
        self.view.sv([webView, segmentedControl])
        webView.height(100%).width(100%).centerHorizontally()
        segmentedControl.height(5%).width(90%).centerHorizontally()
        segmentedControl.Bottom == self.view.Bottom
    }
    
    
    func SetControllerDefaults(){
        
        let searchController = UISearchController(searchResultsController: nil)
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "https://www.greenmatch.com"
        searchController.searchBar.text = "https://www.greenmatch.com"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchController.searchBar.delegate = self
        
        
        segmentedControl = UISegmentedControl()
        segmentedControl = UISegmentedControl(items: ["Notifications", "Live Chat"])
        segmentedControl.tintColor = .black
        segmentedControl.backgroundColor = ColorConstants.segmentedColorBackground
        segmentedControl.addTarget(self, action: #selector(SegmentedControlValueChanged), for: .touchUpInside)
        
        
        view.backgroundColor = .white
        webView = WKWebView(frame: view.frame)
        webView.navigationDelegate = self
        RedirectTo("https://www.greenmatch.ru")
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func SegmentedControlValueChanged(){
        navigationController?.pushViewController(NotificationViewController(), animated: true)
    }
    
    
    func RedirectTo(_ link: String){
        let url = URL(string: link)!
        webView.load(URLRequest(url: url))
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = searchBar.text
        if let urlString = urlString {
            RedirectTo(urlString)
        }
        
        searchBar.resignFirstResponder()
    }
    
    
    
}

extension MainViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}




//
//  ViewController.swift
//  browseme
//
//  Created by Admin on 11/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController, WKNavigationDelegate {
    
    private var mainView: UIView!
    private var webView: WKWebView!
    private var searchController: UISearchController!
    
    override func loadView() {
//        mainView = MainView(frame: UIScreen.main.bounds)
//        self.view.addSubview(mainView)
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.apple.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        SetControllerDefaults()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func SetControllerDefaults(){
        
        let searchController = UISearchController(searchResultsController: nil)
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "https://www.apple.com"
        searchController.searchBar.text = "https://www.apple.com"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
        


}

extension MainViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}


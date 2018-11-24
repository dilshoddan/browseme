//
//  ViewController.swift
//  browseme
//
//  Created by Admin on 11/24/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
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
        
        RedirectTo("https://www.apple.com")
        webView.allowsBackForwardNavigationGestures = true
        
        SetControllerDefaults()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    func SetControllerDefaults(){
        
        let searchController = UISearchController(searchResultsController: nil)
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "https://www.apple.com"
        searchController.searchBar.text = "https://www.apple.com"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchController.searchBar.delegate = self
        
    }
    
    
    
}

extension MainViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}


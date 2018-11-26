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


class MainViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
//    private var mainView: UIView!
    private var segmentedControl: UISegmentedControl!
    private var webView: WKWebView!
    private var searchController: UISearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl = UISegmentedControl()
        segmentedControl = UISegmentedControl(items: ["Tweets", "Media", "Likes"])
        segmentedControl.tintColor = .black
        segmentedControl.backgroundColor = .white
        
        view.backgroundColor = .white
        webView = WKWebView(frame: view.frame)
        webView.navigationDelegate = self
        self.view.sv([webView, segmentedControl])
        webView.height(95%).width(100%).centerHorizontally()
        segmentedControl.height(5%).width(90%).centerHorizontally()
        segmentedControl.Bottom == self.view.Bottom
        

        
        //RedirectTo("https://www.amazon.com")
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
        searchController.searchBar.placeholder = "https://www.amazon.com"
        searchController.searchBar.text = "https://www.amazon.com"
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


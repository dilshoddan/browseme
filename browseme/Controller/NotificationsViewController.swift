//
//  NotificationViewController.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Hero
import Stevia

class NotificationsViewController: UIViewController {
    
    private var notificationsView: NotificationsView!
    private var firebaseWorker: FirebaseWorker!
    private var activityIndicator: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        SetFirebaseDefaults()
        SetControlDefaults()
        render()
        
    }
    
    func SetFirebaseDefaults(){
        firebaseWorker = FirebaseWorker()
    }
    
    func SetControlDefaults(){
        notificationsView = NotificationsView(frame: view.bounds)
        notificationsView.addRecordButtton.addTarget(self, action: #selector(AddRecordAction), for: .touchUpInside)
        notificationsView.backButton.addTarget(self, action: #selector(BackButtonTapped), for: .touchUpInside)
        
        notificationsView.activityIndicator.isHidden = false
        notificationsView.activityIndicator.startAnimating()
//        createSpinnerView()
        firebaseWorker.ReadFirebaseNotificationData(notificationsView.dateLabel, notificationsView.textView, notificationsView.imageView, notificationsView.activityIndicator)
        
        
        
    }
    
    func render(){
        view.sv(notificationsView)
        notificationsView.height(100%).width(100%).centerInContainer()
        notificationsView.updateConstraints()
    }
    
    @objc func AddRecordAction(){
        let addRecordViewController = AddRecordViewController()
        navigationController?.pushViewController(addRecordViewController, animated: true)
    }
    
    @objc func BackButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
}

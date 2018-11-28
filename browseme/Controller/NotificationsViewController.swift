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
import FirebaseDatabase

class NotificationsViewController: UIViewController {

    private var notificationsView: NotificationsView!
    private var databaseReference: DatabaseReference!
    private var databaseHandle: DatabaseHandle!
    private var firebaseWorker: FirebaseWorker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        navigationController?.isNavigationBarHidden = false
        SetControlDefaults()
        render()
        firebaseWorker.ReadFirebaseNotificationData(with: databaseReference, writeTo: notificationsView.textView)
    }
    
    
    
    func SetControlDefaults(){
        databaseReference = Database.database().reference()
        
        notificationsView = NotificationsView(frame: view.bounds)
        firebaseWorker = FirebaseWorker()
    }
    
    func render(){
        view.sv(notificationsView)
        notificationsView.height(100%).width(100%).centerInContainer()
        notificationsView.updateConstraints()
    }

}

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        SetControlDefaults()
        render()
        let returnedData: [String] = FirebaseWorker.ReadFirebaseNotificationData(with: databaseReference)
        for row in returnedData {
            notificationsView.textField.text = notificationsView.textField.text! + "; " + String(row)
        }
    }
    
    
    
    func SetControlDefaults(){
        databaseReference = Database.database().reference()
        
        notificationsView = NotificationsView(frame: view.bounds)
    }
    
    func render(){
        view.sv(notificationsView)
        notificationsView.height(100%).width(100%).centerInContainer()
        notificationsView.updateConstraints()
    }

}

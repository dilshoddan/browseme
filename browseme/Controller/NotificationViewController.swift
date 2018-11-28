//
//  NotificationViewController.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Stevia

class NotificationViewController: UIViewController {

    private var notificationView: NotificationsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetControlDefaults()
        render()
    }
    
    func ReadFirebaseNotificationData(){
        
    }
    
    func SetControlDefaults(){
        
        notificationView = NotificationsView(frame: self.view.bounds)
    }
    
    func render(){
        view.sv(notificationView)
        notificationView.height(100%).width(100%).centerInContainer()
        notificationView.updateConstraints()
    }

}

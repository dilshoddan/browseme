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
    private var firebaseWorker: FirebaseWorker!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        SetControlDefaults()
        render()
        
//        SetFirebaseDefaults()
//        firebaseWorker.ReadFirebaseNotificationData(with: databaseReference, writeTo: notificationsView.textView)
        
    }
    
    func SetFirebaseDefaults(){
        databaseReference = Database.database().reference()
        firebaseWorker = FirebaseWorker()
    }
    
    func SetControlDefaults(){
        notificationsView = NotificationsView(frame: view.bounds)
        notificationsView.addRecordButtton.addTarget(self, action: #selector(AddRecordAction), for: .touchUpInside)
        notificationsView.backButton.addTarget(self, action: #selector(BackButtonTapped), for: .touchUpInside)
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
    
    
    
//    func AddTapGestures(){
//        notificationsView.backLabel.isEnabled = true
//        notificationsView.backLabel.isUserInteractionEnabled = true
//        let backLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(BackLabelAction(recognizer:)))
//        notificationsView.backLabel.addGestureRecognizer(backLabelTapGesture)
//    }

}

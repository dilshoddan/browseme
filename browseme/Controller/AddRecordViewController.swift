//
//  AddRecordViewController.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Hero
import Stevia
import FirebaseDatabase

class AddRecordViewController: UIViewController {

    private var addRecordView: AddRecordView!
    private var databaseReference: DatabaseReference!
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
        view.sv(addRecordView)
        addRecordView.height(100%).width(100%).centerInContainer()
        addRecordView.updateConstraints()
    }

}

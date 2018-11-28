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
        
    }
    
    
    
    func SetControlDefaults(){
        databaseReference = Database.database().reference()
        
        addRecordView = AddRecordView(frame: view.bounds)
        firebaseWorker = FirebaseWorker()
    }
    
    func render(){
        view.sv(addRecordView)
        addRecordView.height(100%).width(100%).centerInContainer()
        addRecordView.updateConstraints()
    }

}

//func uploadImagePic(img1 :UIImage){
//    var data = NSData()
//    data = UIImageJPEGRepresentation(img1!, 0.8)! as NSData
//    // set upload path
//    let filePath = "\(userid)" // path where you wanted to store img in storage
//    let metaData = FIRStorageMetadata()
//    metaData.contentType = "image/jpg"
//
//    self.storageRef = FIRStorage.storage().reference()
//    self.storageRef.child(filePath).put(data as Data, metadata: metaData){(metaData,error) in
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }else{
//            //store downloadURL
//            let downloadURL = metaData!.downloadURL()!.absoluteString
//
//        }
//    }
//
//}

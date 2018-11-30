//
//  FirebaseWorker.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class FirebaseWorker{
    private var imageNameLabel: UITextField!
    public var fileUploaded: Bool!
    
    private var databaseHandle: DatabaseHandle!
    public var returnedData: [String]!
    
    init() {
        returnedData = []
        fileUploaded = false
        imageNameLabel = UITextField()
    }
    
    public func CreateRecordIntoFirebase(_ databaseReference: DatabaseReference){
        databaseReference.child("name").childByAutoId().setValue("Nigel")
        databaseReference.child("name").childByAutoId().setValue("Richard")
    }
    
    public func CreateANotification(_ databaseReference: DatabaseReference, date: String, imageUrl: String, notes: String){
        databaseReference.child("notifications").child("notification").childByAutoId().setValuesForKeys(["date":date, "imageUrl":imageUrl, "notes":notes])
    }
    
    public func ReadFirebaseNotificationData(with databaseReference: DatabaseReference, writeTo textView: UITextView){
        //var dbHandle =
        self.returnedData = []
        databaseReference.child("name").queryLimited(toLast: 1).observe(.childAdded, with: {(data) in
            let name = (data.value as? String)!
            self.returnedData.append(name)
            textView.text = name
        })
    }
    
    public func uploadImage(_ image: UIImage, _ imageNameLabel: UITextField) {
        let randomImageName = "Image_" + String(Int.random(in: Int.min ... Int.max)) + ".jpg"
        let imageData = image.jpegData(compressionQuality: 1.0)!
        let userDefaults = UserDefaults.standard
        let firebaseImagePath = userDefaults.string(forKey: "FirebaseImagePath")
        if let firebaseImagePath = firebaseImagePath {
            let uploadRef = Storage.storage().reference().child("\(firebaseImagePath)\(randomImageName).jpg")
            _ = uploadRef.putData(imageData, metadata: nil) { metadata,
                error in
                if error == nil {
                    imageNameLabel.text = randomImageName
                    self.fileUploaded = true
                    
                } else {
                    //error
                    self.fileUploaded = false
                }
            }
        }
    }
}

//import below JSON structure to firebase
//    // The root of the tree
//    {
//        // grocery-items
//        "grocery-items": {
//            
//            // grocery-items/milk
//            "milk": {
//                
//                // grocery-items/milk/name
//                "name": "Milk",
//                
//                // grocery-items/milk/addedByUser
//                "addedByUser": "David"
//            },
//            
//            "pizza": {
//                "name": "Pizza",
//                "addedByUser": "Alice"
//            },
//        }
//}


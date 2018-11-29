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
    
    private var databaseHandle: DatabaseHandle!
    public var returnedData: [String]!
    
    init() {
        returnedData = []
    }
    
    public func CreateRecordIntoFirebase(_ databaseReference: DatabaseReference){
        databaseReference.child("name").childByAutoId().setValue("Nigel")
        databaseReference.child("name").childByAutoId().setValue("Richard")
    }
    
    public func ReadFirebaseNotificationData(with databaseReference: DatabaseReference, writeTo textField: UITextView){
        //var dbHandle =
        self.returnedData = []
        databaseReference.child("name").observe(.childAdded, with: {(data) in
            let name = (data.value as? String)!
            self.returnedData.append(name)
            textField.text = name
        })
    }
    
    public func uploadImage(_ image: UIImage) -> String {
        var uploaded = false
        let randomImageName = "Image_" + String(Double.random(in: Double.leastNonzeroMagnitude ... Double.greatestFiniteMagnitude)) + ".jpg"
        let imageData = image.jpegData(compressionQuality: 1.0)!
        //UIImageJPEGRepresentation(image, 1.0)
        let uploadRef = Storage.storage().reference().child("images/profimg/\(randomImageName).jpg")
        _ = uploadRef.putData(imageData, metadata: nil) { metadata,
            error in
            if error == nil {
                //success
                print("success")
                uploaded = true
            } else {
                //error
                print("error uploading image")
            }
        }
        if uploaded {
            return randomImageName
        }
        else {
            return ""
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


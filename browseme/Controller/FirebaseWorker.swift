//
//  FirebaseWorker.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import FirebaseDatabase

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
    
    public func ReadFirebaseNotificationData(with databaseReference: DatabaseReference, writeTo textField: UITextField){
        //var dbHandle =
        self.returnedData = []
        databaseReference.child("name").observe(.childAdded, with: {(data) in
            let name = (data.value as? String)!
            self.returnedData.append(name)
            textField.text = textField.text! + name
        })
    }
}

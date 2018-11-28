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
    
    private static var databaseHandle: DatabaseHandle!
    
    public static func CreateRecordIntoFirebase(_ databaseReference: DatabaseReference){
        databaseReference.child("name").childByAutoId().setValue("Nigel")
        databaseReference.child("name").childByAutoId().setValue("Richard")
    }
    
    public static func ReadFirebaseNotificationData(with databaseReference: DatabaseReference) -> [String]{
        //var dbHandle =
        var returnedData: [String] = []
        databaseHandle = databaseReference.child("name").observe(.childAdded, with: {(data) in
            let name: String = (data.value as? String)!
            returnedData.append(name)
        })
        return returnedData
    }
}

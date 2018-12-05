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

class FirebaseWorker {
    
    private var imageNameLabel: UITextField!
    public var fileUploaded: Bool!
    private var databaseReference: DatabaseReference!
    public let userDefaults = UserDefaults.standard
    
    private var databaseHandle: DatabaseHandle!
    public var returnedData: [String]!
    
    init() {
        returnedData = []
        fileUploaded = false
        imageNameLabel = UITextField()
        databaseReference = Database.database().reference()
    }
    
    
    public func CreateANotification(date: String, notes: String, selectedImage: UIImage, withImageName: String, viewController: UIViewController) {
        let firebaseImagePath = userDefaults.string(forKey: "FirebaseImagePath")
        if let firebaseImagePath = firebaseImagePath {
            if fileUploaded {
                let notificationJSON: [String : String] = [
                    "date" : date,
                    "imageUrl" : firebaseImagePath + withImageName,
                    "notes": notes
                ]
                databaseReference.child("notifications").child("notification").childByAutoId().setValue(notificationJSON)
                let alertController = UIAlertController(title: "Saved", message: "Saved", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    print("Saved")
                }))
                viewController.present(alertController, animated: true, completion: nil)
            }
            else {
                let alertController = UIAlertController(title: "Sorry, cannot save now", message: "Please wait while the image saved to the server", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    print("Please wait while the image saved to the server")
                }))
                viewController.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    public func ReadFirebaseNotificationData(writeTo textView: UITextView) -> [String: Any] {
        self.returnedData = []
        let notificationsPath = userDefaults.string(forKey: "FirebaseNotificationPath")
        if let notificationsPath = notificationsPath {
            databaseReference.child(notificationsPath).queryLimited(toLast: 1).observe(.childAdded, with: {(data) in
                let name = (data.value as? String)!
                self.returnedData.append(name)
                textView.text = name
            })
        }
        return [String: Any]()
    }
    

    
    public func uploadImage(date: String, notes: String, selectedImage: UIImage, withImageName: String, viewController: UIViewController) {
        DispatchQueue.global(qos: .userInitiated).async {
            var storedError: Error?
            let downloadGroup = DispatchGroup()
            self.fileUploaded = false
            let imageData = selectedImage.jpegData(compressionQuality: 1.0)!
            let userDefaults = UserDefaults.standard
            let firebaseImagePath = userDefaults.string(forKey: "FirebaseImagePath")
            if let firebaseImagePath = firebaseImagePath {
                
                let uploadRef = Storage.storage().reference().child("\(firebaseImagePath)\(withImageName)")
                downloadGroup.enter()
                _ = uploadRef.putData(imageData, metadata: nil) { metadata,
                    error in
                    if error != nil {
                        self.fileUploaded = false
                        storedError = error
                    }
                    downloadGroup.leave()
                }
            }
            downloadGroup.wait()
            DispatchQueue.main.async{
                self.fileUploaded = true
                self.CreateANotification(date: date, notes: notes, selectedImage: selectedImage, withImageName: withImageName, viewController: viewController)
            }
        }
        
    }
    
}


//public func ReadFirebaseNotificationData(with databaseReference: DatabaseReference, writeTo textView: UITextView){
//    //var dbHandle =
//    self.returnedData = []
//    databaseReference.child("name").queryLimited(toLast: 1).observe(.childAdded, with: {(data) in
//        let name = (data.value as? String)!
//        self.returnedData.append(name)
//        textView.text = name
//    })
//}


//    public func CreateRecordIntoFirebase(_ databaseReference: DatabaseReference){
//        databaseReference.child("name").childByAutoId().setValue("Nigel")
//        databaseReference.child("name").childByAutoId().setValue("Richard")
//    }

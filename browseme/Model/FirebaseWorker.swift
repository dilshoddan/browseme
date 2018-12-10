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
    private var storage: Storage!
    private let firebaseImagePath = UserDefaults.standard.string(forKey: "FirebaseImagePath")
    private let notificationsPath = UserDefaults.standard.string(forKey: "FirebaseNotificationPath")
    
    private var databaseHandle: DatabaseHandle!
    public var notificationReturnValue: [String: Any]!
    
    init() {
        fileUploaded = false
        imageNameLabel = UITextField()
        databaseReference = Database.database().reference()
        storage = Storage.storage()
        notificationReturnValue = [String: Any]()
    }
    
    
    public func CreateANotification(date: String, notes: String, selectedImage: UIImage, withImageName: String, viewController: UIViewController, _ activityIndicator: UIActivityIndicatorView) {
        if let firebaseImagePath = firebaseImagePath {
            if fileUploaded {
                let notificationJSON: [String : String] = [
                    "date" : date,
                    "imageUrl" : firebaseImagePath + withImageName,
                    "notes": notes
                ]
                databaseReference.child("notifications").child("notification").childByAutoId().setValue(notificationJSON)
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                activityIndicator.removeFromSuperview()
//                let alertController = UIAlertController(title: "Saved", message: "", preferredStyle: .alert)
//                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//                    print("Saved")
//                }))
//                viewController.present(alertController, animated: true, completion: nil)
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
    
    
    
    
    public func ReadFirebaseNotificationData(_ notificationDate: UILabel, _ notificationNotes: UITextView, _ notificationImageView: UIImageView, _ activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.notificationReturnValue = [String: Any]()
            if let notificationsPath = self.notificationsPath {
                let downloadGroup = DispatchGroup()
                downloadGroup.enter()
                self.databaseReference.child(notificationsPath).queryLimited(toLast: 1).observe(.childAdded, with:
                    {(data) in
                        self.notificationReturnValue = (data.value as? [String: Any])!
                        let imageUrl = (self.notificationReturnValue["imageUrl"] as? String)
                        let date = (self.notificationReturnValue["date"] as? String)
                        let notes = (self.notificationReturnValue["notes"] as? String)
                        if let date = date, let notes = notes {
                            notificationDate.text = date
                            notificationNotes.text = notes
                        }
                        if let imageUrl = imageUrl {
                            self.ReadFirebaseNotificationImage(imageUrl, notificationImageView, activityIndicator)
                            //max size 40MB
                            
                        }
                        downloadGroup.leave()
                })
                downloadGroup.wait()
            }
        }
        
    }
    
    public func ReadFirebaseNotificationImage(_ imageUrl: String, _ notificationImageView: UIImageView, _ activityIndicator: UIActivityIndicatorView){
        DispatchQueue.global(qos: .userInitiated).async {
            let downloadGroup = DispatchGroup()
            downloadGroup.enter()
            self.storage.reference(withPath: imageUrl).getData(maxSize: (40*1024*1024), completion:
                { data, error in
                if error == nil {
                    if let data = data {
                        let image = UIImage(data: data)!
                        self.notificationReturnValue["image"] = image
                        notificationImageView.image = image
                        
                    }
                }
                downloadGroup.leave()
            })
            downloadGroup.wait()
            DispatchQueue.main.async{
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    
    
    public func uploadImage(date: String, notes: String, selectedImage: UIImage, withImageName: String, viewController: UIViewController, _ activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.global(qos: .userInitiated).async {
            let downloadGroup = DispatchGroup()
            self.fileUploaded = false
            let imageData = selectedImage.jpegData(compressionQuality: 1.0)!
            let userDefaults = UserDefaults.standard
            let firebaseImagePath = userDefaults.string(forKey: "FirebaseImagePath")
            if let firebaseImagePath = firebaseImagePath {
                
                let uploadRef = self.storage.reference().child("\(firebaseImagePath)\(withImageName)")
                downloadGroup.enter()
                _ = uploadRef.putData(imageData, metadata: nil) { metadata,
                    error in
                    if error != nil {
                        self.fileUploaded = false
                    }
                    downloadGroup.leave()
                }
            }
            downloadGroup.wait()
            DispatchQueue.main.async{
                self.fileUploaded = true
                self.CreateANotification(date: date, notes: notes, selectedImage: selectedImage, withImageName: withImageName, viewController: viewController, activityIndicator)
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

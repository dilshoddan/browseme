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

class AddRecordViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var addRecordView: AddRecordView!
    private var databaseReference: DatabaseReference!
    private var firebaseWorker: FirebaseWorker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add a record"
        hero.isEnabled = true
        navigationController?.isNavigationBarHidden = false
        SetControlDefaults()
        render()
        AddTapGestures()
        
    }
    
    
    
    func SetControlDefaults(){
        databaseReference = Database.database().reference()
        
        addRecordView = AddRecordView(frame: view.bounds)
        firebaseWorker = FirebaseWorker()
        navigationController?.isNavigationBarHidden = false
    }
    
    func render(){
        view.sv(addRecordView)
        addRecordView.height(100%).width(100%).centerInContainer()
        addRecordView.updateConstraints()
    }
    
    @objc func PickADate(recognizer:UITapGestureRecognizer){
//        let formatter = DateFormatter()
//        formatter.dateStyle = DateFormatter.Style.medium
//        formatter.timeStyle = DateFormatter.Style.none
//        addRecordView.dateLabel.text = formatter.string(from: sender.date)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
//        dobField.inputView = datePicker
        
    }

    @objc func PickAnImage(recognizer:UITapGestureRecognizer){
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        self.present(picker, animated: true, completion: nil)
        
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        addRecordView.dateLabel.text = formatter.string(from: sender.date)
    }
    
    func AddTapGestures(){
        addRecordView.dateLabel.isEnabled = true
        addRecordView.dateLabel.isUserInteractionEnabled = true
        let pickADateTapGesture = UITapGestureRecognizer(target: self, action: #selector(PickADate(recognizer:)))
        addRecordView.dateLabel.addGestureRecognizer(pickADateTapGesture)
        
        addRecordView.imageView.isUserInteractionEnabled = true
        let pickAnImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(PickAnImage(recognizer:)))
        addRecordView.imageView.addGestureRecognizer(pickAnImageTapGesture)
        
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



//import Firebase
//import FirebaseStorage
//
//class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    @IBOutlet weak var profileImage: UIImageView!
//    @IBOutlet weak var usernameField: UITextField!
//    @IBOutlet weak var emailField: UITextField!
//    @IBOutlet weak var passwordField: UITextField!
//    @IBOutlet weak var dobField: UITextField!
//    @IBOutlet weak var selectImageButton: UIButton!
//
//    var imageFileName = ""
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
//
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = UIDatePickerMode.date
//        datePicker.addTarget(self, action: #selector(RegisterViewController.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
//        dobField.inputView = datePicker
//
//        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
//        self.profileImage.clipsToBounds = true;
//
//    }
//
//    @objc func datePickerValueChanged(sender: UIDatePicker) {
//        let formatter = DateFormatter()
//        formatter.dateStyle = DateFormatter.Style.medium
//        formatter.timeStyle = DateFormatter.Style.none
//        dobField.text = formatter.string(from: sender.date)
//    }
//
//
//    @IBAction func selectImageTapped(_ sender: UIButton) {
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        self.present(picker, animated: true, completion: nil)
//    }
//
//    func uploadImage(image: UIImage) {
//        let randomName = randomStringWithLength(length: 10)
//        let imageData = UIImageJPEGRepresentation(image, 1.0)
//        let uploadRef = Storage.storage().reference().child("images/profimg/\(randomName).jpg")
//        let uploadTask = uploadRef.putData(imageData!, metadata: nil) { metadata,
//            error in
//            if error == nil {
//                //success
//                print("success")
//                self.imageFileName = "\(randomName as String).jpg"
//            } else {
//                //error
//                print("error uploading image")
//            }
//        }
//    }
//
//    func randomStringWithLength(length: Int) -> NSString {
//        let characters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        let randomString: NSMutableString = NSMutableString(capacity: length)
//
//        for i in 0..<length {
//            var len = UInt32(characters.length)
//            var rand = arc4random_uniform(len)
//            randomString.appendFormat("%C", characters.character(at: Int(rand)))
//        }
//        return randomString
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        // will run if the user hits cancel
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        // will run when the user finishes picking an image from the library
//        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            self.profileImage.image = pickedImage
//            self.selectImageButton.isEnabled = false
//            self.selectImageButton.isHidden = true
//            uploadImage(image: pickedImage)
//            picker.dismiss(animated: true, completion: nil)
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    @IBAction func registerTapped(_ sender: UIButton) {
//
//        let username = usernameField.text
//        let email = emailField.text
//        let password = passwordField.text
//        let dob = dobField.text
//
//        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
//            if error != nil {
//                //error creating account
//                let alert = UIAlertController(title: "Error", message: "An error occurred when creating your account, please try again.", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }else {
//                //account created
//
//                if (self.imageFileName != "") {
//                    if let uid = Auth.auth().currentUser?.uid {
//
//                        let regObject: Dictionary<String, Any> = [
//                            "uid" : uid,
//                            "username" : username,
//                            "dateofbirth" : dob,
//                            "profimage" : self.imageFileName
//                        ]
//                        Database.database().reference().child("posts").child(uid).setValue(regObject)
//
//                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoggedInVC")
//                        self.present(vc!, animated: true, completion: nil)
//                    }else {
//                        //image hasnt finished uploading
//                        let alert = UIAlertController(title: "Please wait", message: "Your image has not finished uploading yet, please wait...", preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//
//                //let alert = UIAlertController(title: "Success!", message: "Account has been created...", preferredStyle: .alert)
//                //alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                //self.present(alert, animated: true, completion: nil)
//
//            }
//        }
//}

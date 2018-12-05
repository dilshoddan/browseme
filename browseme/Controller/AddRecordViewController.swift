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


class AddRecordViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    private var addRecordView: AddRecordView!
    private var firebaseWorker: FirebaseWorker!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SetControlDefaults()
        render()
        AddTapGestures()
        SetFirebaseDefaults()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.resignFirstResponder()
        return false
    }
    
    func SetFirebaseDefaults(){
        firebaseWorker = FirebaseWorker()
    }
    
    
    func SetControlDefaults(){
        self.title = "Add a record"
        hero.isEnabled = true
        addRecordView = AddRecordView(frame: view.bounds)
        addRecordView.backButton.addTarget(self, action: #selector(BackButtonTapped), for: .touchUpInside)
        addRecordView.saveToFirebase.addTarget(self, action: #selector(SaveNotificationToFirebase), for: .touchUpInside)
        addRecordView.dateTextField.delegate = self
    }
    
    func render(){
        view.sv(addRecordView)
        addRecordView.height(100%).width(100%).centerInContainer()
        addRecordView.updateConstraints()
    }
    
    @objc func SaveNotificationToFirebase(){
        let date = addRecordView.dateTextField.text
        let notes = addRecordView.notes.text
        let image = addRecordView.imageView.image
        let imageName = addRecordView.imageNameLabel.text
        if let date = date, let notes = notes, let image = image, let imageName = imageName,!(imageName.isEmpty){
            firebaseWorker.uploadImage(date: date, notes: notes, selectedImage: image, withImageName: imageName, viewController: self)
            //CreateANotification(databaseReference, date: date, notes: notes, selectedImage: image, withImageName: imageName, viewController: self)
        }
        else{
            let alertController = UIAlertController(title: "Sorry, cannot save now", message: "Make sure all properties are set", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func DatePickerValueChanged(sender: UIDatePicker) {
        addRecordView.dateTextField.text = sender.date.ToString(dateFormat: "dd-MMM-yyyy")
    }
    
    @objc func PickADate(recognizer:UITapGestureRecognizer){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(DatePickerValueChanged(sender:)), for: .valueChanged)
        addRecordView.dateTextField.inputView = datePicker
    }
    
    @objc func PickAnImage(recognizer:UITapGestureRecognizer){
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // will run if the user hits cancel
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        let randomImageName = "Image_" + String(Int.random(in: Int.min ... Int.max)) + ".jpg"
        addRecordView.imageNameLabel.text = randomImageName
        addRecordView.imageView.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func BackButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    func AddTapGestures(){
        addRecordView.dateTextField.isEnabled = true
        addRecordView.dateTextField.isUserInteractionEnabled = true
        let pickADateTapGesture = UITapGestureRecognizer(target: self, action: #selector(PickADate(recognizer:)))
        addRecordView.dateTextField.addGestureRecognizer(pickADateTapGesture)
        
        addRecordView.imageView.isUserInteractionEnabled = true
        let pickAnImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(PickAnImage(recognizer:)))
        addRecordView.imageView.addGestureRecognizer(pickAnImageTapGesture)
    }
}

//
//  AddRecordView.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Stevia

class AddRecordView: UIView {

    public var shouldSetupConstraints: Bool!
    public var dateTextField: UITextField!
    public var imageNameLabel: UITextField!
    public var imageView: UIImageView!
    public var textView: UITextView!
    public var saveToFirebase: UIButton!
    public var backButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        shouldSetupConstraints = true
        SetControlDefaults()
        updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetControlDefaults(){
        self.backgroundColor = .white
        
        dateTextField = UITextField()
        dateTextField.text = Date().ToString(dateFormat: "dd-MMM-yyyy")
        dateTextField.tintColor = .white
        dateTextField.font = UIFont(name: "Times New Roman", size: 32)
        dateTextField.textColor = .white
        dateTextField.isEnabled = false
        dateTextField.isUserInteractionEnabled = false
        
        imageNameLabel = UITextField()
        imageNameLabel.tintColor = .white
        imageNameLabel.font = UIFont(name: "Times New Roman", size: 10)
        imageNameLabel.text = "placeholder"
        imageNameLabel.textColor = UIColor.white
        imageNameLabel.isEnabled = false
        imageNameLabel.isUserInteractionEnabled = false
        
        
        imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        imageView.clipsToBounds = true
        
        textView = UITextView()
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.font = UIFont(name: "Times New Roman", size: 18)
        
        saveToFirebase = UIButton()
        saveToFirebase.backgroundColor = ColorConstants.notificationsViewBackButtonColor
        saveToFirebase.setTitle("Save to Firebase", for: .normal)
        saveToFirebase.tintColor = .black
        saveToFirebase.layer.cornerRadius = 5
        saveToFirebase.clipsToBounds = true
        saveToFirebase.isEnabled = true
        saveToFirebase.isUserInteractionEnabled = true
        
        backButton = UIButton()
        backButton.backgroundColor = ColorConstants.notificationsViewBackButtonColor
        backButton.setTitle("<Back", for: .normal)
        backButton.tintColor = .black
        backButton.layer.cornerRadius = 5
        backButton.clipsToBounds = true
        backButton.isEnabled = true
        backButton.isUserInteractionEnabled = true
    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([imageView, textView, dateTextField, saveToFirebase, imageNameLabel, backButton])
            
            imageView.Top == self.Top
            imageView.Bottom == textView.Top
            textView.Bottom == self.Bottom
            dateTextField.Bottom == imageView.Bottom
            backButton.Top == self.Top
            backButton.Left == self.Left
            imageNameLabel.Bottom == backButton.Top
            imageNameLabel.Right == self.Right
            
//            saveToFirebase.Bottom == textView.Bottom
            
            imageView.height(35%).width(100%)
            textView.height(65%).width(100%)
            dateTextField.height(5%).width(80%).left(2%)
            saveToFirebase.height(6%).width(45%).right(2%).bottom(2%)
            imageNameLabel.height(3%).width(30%).top(4%)
            backButton.height(4%).width(18%).top(6%)
            
        }
        super.updateConstraints()
    }


}

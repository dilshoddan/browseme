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
    public var dateLabel: UITextField!
    public var imageNameLabel: UITextField!
    public var imageView: UIImageView!
    public var textView: UITextView!
    public var saveToFirebase: UIButton!
    
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
        
        dateLabel = UITextField()
        dateLabel.text = Date().ToString(dateFormat: "dd-MMM-yyyy")
        dateLabel.tintColor = .white
        dateLabel.font = UIFont(name: "Times New Roman", size: 32)
        
        imageNameLabel = UITextField()
        imageNameLabel.tintColor = .white
        imageNameLabel.font = UIFont(name: "Times New Roman", size: 10)
        imageNameLabel.text = "placeholder"
        
        
        imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        imageView.clipsToBounds = true
        
        textView = UITextView()
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.font = UIFont(name: "Times New Roman", size: 18)
        
        saveToFirebase = UIButton()
        saveToFirebase.backgroundColor = .blue
        saveToFirebase.setTitle("Save to Firebase", for: .normal)
        saveToFirebase.tintColor = .white
        saveToFirebase.layer.cornerRadius = 5
        saveToFirebase.clipsToBounds = true
        saveToFirebase.isEnabled = true
        saveToFirebase.isUserInteractionEnabled = true
    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([imageView, textView, dateLabel, saveToFirebase, imageNameLabel])
            
            imageView.Top == self.Top
            imageView.Bottom == textView.Top
            textView.Bottom == self.Bottom
            dateLabel.Bottom == imageView.Bottom
            imageNameLabel.Bottom == imageView.Bottom
            
//            saveToFirebase.Bottom == textView.Bottom
            
            imageView.height(35%).width(100%)
            textView.height(65%).width(100%)
            dateLabel.height(5%).width(80%).left(2%)
            imageNameLabel.height(3%).width(20%).right(2%)
            saveToFirebase.height(6%).width(45%).right(2%).bottom(2%)
            
            
            
            
            
            
            
            
        }
        super.updateConstraints()
    }


}

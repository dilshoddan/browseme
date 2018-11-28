//
//  AddRecordView.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Hero
import Stevia

class AddRecordView: UIView {

    public var shouldSetupConstraints: Bool!
    public var dateLabel: UILabel!
    public var imageView: UIImageView!
    public var textView: UITextView!
    
    public var datePicker: UIDatePicker!
    public var imagePicker: UIImagePickerController!
    public var textViewEditor: UITextView!
    
    
    
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
        
        dateLabel = UILabel()
        dateLabel.text = Date().ToString(dateFormat: "dd-MMM-yyyy")
        dateLabel.tintColor = .white
        dateLabel.font = UIFont(name: "Times New Roman", size: 32)
        
        
        imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.5183775907, green: 0.5156218294, blue: 0.5049525617, alpha: 1)
        textView = UITextView()
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name: "Times New Roman", size: 18)
        
        
        
    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([imageView, textView, dateLabel])
            
            imageView.height(35%).width(100%)
            textView.height(65%).width(100%)
            imageView.Top == self.Top
            textView.Bottom == self.Bottom
            
            dateLabel.height(10%).width(80%).left(5)
            dateLabel.Bottom == imageView.Bottom
            
            imageView.Bottom == textView.Top
            
            
        }
        super.updateConstraints()
    }


}

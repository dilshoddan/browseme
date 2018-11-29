//
//  NotificationsView.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Stevia

class NotificationsView: UIView {
    
    //    private var segmentedControl: UISegmentedControl!
    public var shouldSetupConstraints: Bool!
    public var dateLabel: UILabel!
    public var imageView: UIImageView!
    public var textView: UITextView!
    public var addRecordButtton: UIButton!
    
    
    
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
        
        addRecordButtton = UIButton()
        addRecordButtton.backgroundColor = .blue
        addRecordButtton.setTitle("Add A New Record", for: .normal)
        addRecordButtton.tintColor = .white
        addRecordButtton.layer.cornerRadius = 5
        addRecordButtton.clipsToBounds = true
        addRecordButtton.isEnabled = true
        addRecordButtton.isUserInteractionEnabled = true
    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([imageView, textView, dateLabel, addRecordButtton])
            
            dateLabel.Bottom == imageView.Bottom
            imageView.Top == self.Top
            imageView.Bottom == textView.Top
            textView.Bottom == self.Bottom
            
            
//            addRecordButtton.Bottom == textView.Bottom
//            addRecordButtton.Right == textView.Right
            
            imageView.height(35%).width(100%)
            textView.height(65%).width(100%)
            dateLabel.height(10%).width(80%).left(2%)
            addRecordButtton.height(6%).width(50%).right(2%).bottom(2%)
            
            
            
        }
        super.updateConstraints()
    }
}

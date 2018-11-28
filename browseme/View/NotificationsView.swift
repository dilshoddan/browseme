//
//  NotificationsView.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Stevia
import Hero

class NotificationsView: UIView {
    
    //    private var segmentedControl: UISegmentedControl!
    public var shouldSetupConstraints: Bool!
    public var dateLabel: UILabel!
    public var imageView: UIImageView!
    public var textView: UITextView!
    
    
    
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
        dateLabel.tintColor = .black
        
        
        imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.5183775907, green: 0.5156218294, blue: 0.5049525617, alpha: 1)
        textView = UITextView()
        textView.isUserInteractionEnabled = false
        
        
        
    }
    
    override func updateConstraints(){
        if(shouldSetupConstraints){
            self.sv([dateLabel, imageView, textView])
            dateLabel.height(10%).width(80%).centerHorizontally()
            imageView.height(30%).width(100%).centerHorizontally()
            textView.height(70%).width(100%).centerHorizontally()
            self.layout(
                150,
                |-dateLabel-|,
                |-imageView-|,
                |-textView-|
            )
            dateLabel.Bottom == imageView.CenterY
            
        }
        super.updateConstraints()
    }
}

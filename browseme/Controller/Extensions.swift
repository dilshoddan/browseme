//
//  Extensions.swift
//  browseme
//
//  Created by Admin on 11/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

extension Date
{
    func ToString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

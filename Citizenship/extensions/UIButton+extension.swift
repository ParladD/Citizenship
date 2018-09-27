//
//  UIButton+extension.swift
//  Citizenship
//
//  Created by Parlad Dhungana on 2018-09-11.
//  Copyright © 2018 Parlad Dhungana. All rights reserved.
//

import UIKit

extension UIButton{
    
    func setRadius(of radius: CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
        
    func optionsButton(text: String, bgColor: UIColor, size: CGFloat){
       self.layer.cornerRadius = 8
       self.backgroundColor = bgColor
       self.layer.masksToBounds = true
       let attributedString =  NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Arial-BoldMT", size: size) ?? "Courier"])
        self.setAttributedTitle(attributedString, for: .normal)
        
    }
    
}

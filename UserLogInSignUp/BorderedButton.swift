//
//  BorderedButton.swift
//  UserLogInSignUp
//
//  Created by Appinventiv mac on 23/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {

    //  RoundedButton.swift
    //
    
   
    
    @IBDesignable
    class RoundedButton:UIButton {
        
        @IBInspectable var borderWidth: CGFloat = 0 {
            didSet {
                layer.borderWidth = borderWidth
            }
        }
        //Normal state bg and border
        @IBInspectable var normalBorderColor: UIColor? {
            didSet {
                layer.borderColor = normalBorderColor?.cgColor
            }
        }
        
        @IBInspectable var normalBackgroundColor: UIColor? {
            didSet {
                setBgColorForState(color: normalBackgroundColor, forState: [])
            }
        }
        
        
        //Highlighted state bg and border
        @IBInspectable var highlightedBorderColor: UIColor?
        
        @IBInspectable var highlightedBackgroundColor: UIColor? {
            didSet {
                setBgColorForState(color: highlightedBackgroundColor, forState: .highlighted)
            }
        }
        
        
        private func setBgColorForState(color: UIColor?, forState: UIControlState){
            if color != nil {
                setBackgroundImage(UIImage.imageWithColor(color: color!), for: forState)
                
            } else {
                setBackgroundImage(nil, for: forState)
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            layer.cornerRadius = layer.frame.height / 2
            clipsToBounds = true
            
            if borderWidth > 0 {
                if state == [] && !CGColor==Color(layer.borderColor, normalBorderColor?.cgColor) {
                    layer.borderColor = normalBorderColor?.cgColor
                } else if state == .highlighted && highlightedBorderColor != nil{
                    layer.borderColor = highlightedBorderColor!.cgColor
                }
            }
        }
        
    }
}
    //Extension Required by RoundedButton to create UIImage from UIColor
    extension UIImage {
        class func imageWithColor(color: UIColor) -> UIImage {
            let rect: CGRect = CGRectMake(0, 0, 1, 1)
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), false, 1.0)
            color.setFill()
            UIRectFill(rect)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return image
        }
    }



//
//  BoarderButton.swift
//  UserLogInSignUp
//
//  Created by Appinventiv mac on 23/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import UIKit

class BoarderButton: UIButton {

    override init(frame: CGRect) {
            super.init(frame: frame)
            
        layer.borderColor = tintColor.cgColor
            layer.borderWidth = 1
            layer.cornerRadius = 5
            
            contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("NSCoding not supported")
//        }
//        
        override func tintColorDidChange() {
            super.tintColorDidChange()
            
            layer.borderColor = tintColor.cgColor
        }
        
    override var isHighlighted: Bool {
            didSet {
                let fadedColor = tintColor.withAlphaComponent(0.2).cgColor
                
                if isHighlighted {
                    layer.borderColor = fadedColor
                } else {
                    layer.borderColor = tintColor.cgColor
                    
                    let animation = CABasicAnimation(keyPath: "borderColor")
                    animation.fromValue = fadedColor
                    animation.toValue = tintColor.cgColor
                    animation.duration = 0.4
                    layer.add(animation, forKey: "")
                }
            }
        }
    }



//
//  RoundButton.swift
//  manny-social
//
//  Created by Emmanuel Erilibe on 1/13/17.
//  Copyright © 2017 Emmanuel Erilibe. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
//        layer.cornerRadius = 70.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }

}

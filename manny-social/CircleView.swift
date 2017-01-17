//
//  CircleView.swift
//  manny-social
//
//  Created by Emmanuel Erilibe on 1/15/17.
//  Copyright © 2017 Emmanuel Erilibe. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}

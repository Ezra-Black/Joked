//
//  UIView+Extensions.swift
//  Joked
//
//  Created by Ezra Black on 11/17/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
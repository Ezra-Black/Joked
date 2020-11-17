//
//  UIButton+Extensions.swift
//  Joked
//
//  Created by Ezra Black on 11/17/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIButton {
    func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.98
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
    }
    func flash() {
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.duration = 0.3
    flash.fromValue = 1
    flash.toValue = 0.1
    flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    flash.autoreverses = true
    flash.repeatCount = 2
    layer.add(flash, forKey: nil)
    }

}

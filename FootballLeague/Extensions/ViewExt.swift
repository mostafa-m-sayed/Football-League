//
//  ViewExt.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
import UIKit

extension UIView{
    @objc func addShadow(color: UIColor, radius: CGFloat = 5, x: CGFloat = 0, y: CGFloat = 0) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = radius
        layer.masksToBounds = false
        layer.shadowOffset.height = y
        layer.shadowOffset.width = x
    }
}


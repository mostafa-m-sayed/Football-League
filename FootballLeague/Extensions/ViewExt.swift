//
//  ViewExt.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
import UIKit

extension UIView{
    @objc func addShadow(color: UIColor, radius: CGFloat = 5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.4
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
}


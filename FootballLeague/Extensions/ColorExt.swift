//
//  ColorExt.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static func getColorBy(name: String) -> UIColor {
        switch name {
            case "Red":
                return .red
            case "Black":
                return .black
            case "Green":
                return .green
            case "Blue":
                return .blue
            case "White":
                return .white
            case "Yellow":
                return .yellow
            case "Sky Blue":
                return UIColor(rgb: 0x000080)
            case "Navy Blue":
                return UIColor(rgb: 0x000080)
            case "Gold":
                return UIColor(rgb: 0xFFD700)
            default:
                return .white
        }
    }
}

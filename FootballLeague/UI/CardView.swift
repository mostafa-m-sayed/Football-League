//
//  CardView.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
import UIKit
class CardView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addShadow(color: UIColor.gray, radius: 10)
        self.layer.cornerRadius = 10

    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    

}

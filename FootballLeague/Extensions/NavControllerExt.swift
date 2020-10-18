//
//  File.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import UIKit
extension UINavigationController {
    func initNavigationBar() {
        navigationBar.tintColor = UIColor.white
        let titleDict = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font:UIFont.italicSystemFont(ofSize: 20)]
        self.navigationBar.titleTextAttributes = titleDict
    }
}

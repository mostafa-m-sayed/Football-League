//
//  File.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import UIKit
extension UINavigationController {
    func initNavigationBar(title: String?, show: Bool) {
        navigationBar.tintColor = UIColor.white
        let titleDict = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font:UIFont.italicSystemFont(ofSize: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
    }
}

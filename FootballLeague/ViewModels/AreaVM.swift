//
//  AreaVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import Foundation
struct AreaVM {
    var area: Area
    
    var id: Int {
        return area.id ?? 0
    }
    var name: String {
        return area.name ?? ""
    }
}

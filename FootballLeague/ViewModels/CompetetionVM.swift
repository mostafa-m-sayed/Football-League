//
//  CompetetionVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import Foundation
struct CompetetionVM {
    var competetion: Competition
    var id: Int {
        return competetion.id ?? 0
    }
    var name: String {
        return competetion.name ?? ""
    }
    var code: String {
        return competetion.code ?? ""
    }
    var plan: String {
        return competetion.plan ?? ""
    }
    var area: AreaVM {
        guard let area = competetion.area else { return AreaVM(area: Area())}
        return AreaVM(area: area)
    }
}

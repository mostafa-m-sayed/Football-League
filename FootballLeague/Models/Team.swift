//
//  Team.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
struct Team: Codable {

    var id: Int?
    var name: String?
    var shortName: String?
    var tla: String?
    var area: Area?
    var crestUrl: String?
    var address: String?
    var phone: String?
    var website: String?
    var email: String?
    var founded:Int?
    var clubColors: String?
    var venue: String?
    var lastUpdated: String?
}

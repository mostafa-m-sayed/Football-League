//
//  Competitions.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
struct Competition: Codable {
    var id:Int?
    var name:String?
    var code:String?
    var plane:String?
    var area:Area?
    var lastUpdated:String?
}

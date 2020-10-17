//
//  CompetitionTeams.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
struct CompetitionTeams: Codable {
    var count:Int?
    var competition:Competition?
    var season: Season?
    var teams:[Team]?
    
}

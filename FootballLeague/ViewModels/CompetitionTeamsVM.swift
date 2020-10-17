//
//  CompetitonTeamsVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
struct CompetitionTeamsVM {
    var competitionTeam : CompetitionTeams
    var teams:  [TeamVM] {
        guard let teams = competitionTeam.teams else { return [TeamVM]() }
        return teams.map{ TeamVM(team: $0) }
    }
}

//
//  TeamsVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
struct TeamVM {
    var team: Team
    var id: Int {
        return team.id ?? 0
    }
    var name: String {
        return team.name ?? ""
    }
    var shortName: String {
        return team.shortName ?? ""
    }
    var tla: String {
        return team.tla ?? ""
    }
    var crestUrl: String {
        return team.crestUrl ?? ""
    }
    var address: String {
        return team.address ?? ""
    }
    var area: Area {
        return team.area ?? Area()
    }
    var phone: String {
        return team.phone ?? ""
    }
    var website: String {
        return team.website ?? ""
    }
    var email: String {
        return team.email ?? ""
    }
    var founded: Int {
        return team.founded ?? 0
    }

    var clubColors: String {
        return team.clubColors ?? ""
    }
    var venue: String {
        return team.venue ?? "--"
    }
    var lastUpdated: String {
        return team.lastUpdated ?? ""
    }
}

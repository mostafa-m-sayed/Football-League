//
//  FavouriteVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import Foundation
class FavouriteVM {
    func getFavourites() -> [TeamVM] {
        if let favourites: [Team] = UserDefaults.standard.getObject(key: "favourites") {
            return favourites.map { TeamVM(team: $0) }
        }
        else {
            return [TeamVM]()
        }
    }

    static func addToFavourites(team: Team) {
        if var teams: [Team] = UserDefaults.standard.getObject(key: "favourites") {
            if teams.firstIndex(where: { (item) -> Bool in
                item.id == team.id
            }) != nil {
                return
            }
            teams.append(team)
            UserDefaults.standard.saveObject(rawData: teams, forKey: "favourites")
        } else {
            var teams = [Team]()
            teams.append(team)
            UserDefaults.standard.saveObject(rawData: teams, forKey: "favourites")
        }
    }
}

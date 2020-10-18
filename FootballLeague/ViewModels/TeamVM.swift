//
//  TeamsVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
import UIKit
import Alamofire

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
    
    var clubColors: [UIColor] {
        guard let colorNames = team.clubColors else { return []}
        var colors = [UIColor]()
        let splittedColors = colorNames.split(separator: Character("/"))
        for color in splittedColors {
            colors.append(UIColor.getColorBy(name: color.trimmingCharacters(in: .whitespaces)))
        }
        return colors
    }
    
    var venue: String {
        return team.venue ?? "--"
    }
    
    var players: [PlayerVM] {
        guard let players = team.squad else { return []}
        return players.map { PlayerVM(player: $0)}
    }
    
    var activeCompetetion: [CompetetionVM] {
        guard let competetion = team.activeCompetitions else { return []}
        return  competetion.map {CompetetionVM(competetion: $0)} 
    }
    
    var isFavourite: Bool {
        return TeamVM.getFavourites().contains {
            $0.id == self.id
        }
    }
    
    func getteam(teamID: String, completion: @escaping (_ team: TeamVM?, _ error: String?) -> Void) {
        let header: HTTPHeaders  = ["X-Auth-Token": "eaab73f7a0cf4caca41e99306a4e04af"]
        let url = "\(ServiceBase.team)\(teamID)"
        
        if let data = FastCache(type: .team).get(url: url) {
            if let team: Team = data.getObject() {
                completion(TeamVM(team: team), nil)
            }
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            print(response.result)
            switch response.result {
                case .success(let value):
                    if let val = value as? NSDictionary {
                        if let team: Team = val.getObject() {
                            completion(TeamVM(team: team), nil)
                            FastCache(type: .team).save(response: val, url: url)
                        }
                    }
                case.failure(let error):
                    print(error)
            }
        }
    }
    
    static func getFavourites() -> [TeamVM] {
        if let favourites: [Team] = UserDefaults.standard.getObject(key: "favourites") {
            return favourites.map { TeamVM(team: $0) }
        }
        else {
            return [TeamVM]()
        }
    }
    
    func addToFavourites() {
        if var teams: [Team] = UserDefaults.standard.getObject(key: "favourites") {
            if teams.firstIndex(where: { (item) -> Bool in
                item.id == self.id
            }) != nil {
                return
            }
            teams.append(self.team)
            UserDefaults.standard.saveObject(rawData: teams, forKey: "favourites")
        } else {
            var teams = [Team]()
            teams.append(self.team)
            UserDefaults.standard.saveObject(rawData: teams, forKey: "favourites")
        }
    }
    
    func removeFavourite() {
        if var teams: [Team] = UserDefaults.standard.getObject(key: "favourites") {
            if let index = teams.firstIndex(where: { (item) -> Bool in
                item.id == self.id
            }) {
                teams.remove(at: index)
                UserDefaults.standard.saveObject(rawData: teams, forKey: "favourites")
            }
        }
    }
}

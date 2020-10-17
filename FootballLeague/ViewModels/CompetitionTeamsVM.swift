//
//  CompetitonTeamsVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
import Alamofire
struct CompetitionTeamsVM {
    var competitionTeam : CompetitionTeams
    
    var teams:  [TeamVM] {
        guard let teams = competitionTeam.teams else { return [TeamVM]() }
        return teams.map{ TeamVM(team: $0) }
    }
    
    
    static func getCompetitionTeams(teamID :Int ,completion: @escaping (_ users: CompetitionTeamsVM?, _ error: String?) -> Void){
        let header: HTTPHeaders  = ["X-Auth-Token": "eaab73f7a0cf4caca41e99306a4e04af"]
    let url = ServiceBase.CompetitionTeams + "\(teamID)/teams"
    AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            print(response.result)
        switch response.result {
        case .success(let value):
            if let val = value as? NSDictionary {
                if let comp: CompetitionTeams = val.getObject() {
                   completion(CompetitionTeamsVM(competitionTeam: comp),nil)
                }
            }
        case.failure(let error):
            print(error)
        }
        
        }
    }
}

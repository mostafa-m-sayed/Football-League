//
//  CompetitonTeamsVM.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import Foundation
import Alamofire
struct CompetitionTeamsVM {
    var competitionTeam: CompetitionTeams
    
    var teams:  [TeamVM] {
        guard let teams = competitionTeam.teams else { return [TeamVM]() }
        return teams.map{ TeamVM(team: $0) }
    }
    
    static func getCompetitionTeams(competitionsId: Int, completion: @escaping (_ competition: CompetitionTeamsVM?, _ error: String?, _ cached: Bool ) -> Void) {
        let header: HTTPHeaders  = ["X-Auth-Token": "eaab73f7a0cf4caca41e99306a4e04af"]
        let url = ServiceBase.CompetitionTeams + "\(competitionsId)/teams"
        
        if let data = FastCache(type: .competetion).get(url: url) {
            if let comp: CompetitionTeams = data.getObject() {
                completion(CompetitionTeamsVM(competitionTeam: comp), nil, true)
            }
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            print(response.result)
            switch response.result {
                case .success(let value):
                    if let val = value as? NSDictionary {
                        if let comp: CompetitionTeams = val.getObject() {
                            completion(CompetitionTeamsVM(competitionTeam: comp), nil, false)
                            FastCache(type: .competetion).save(response: val, url: url)
                        }
                    }
                case.failure(let error):
                    switch error {
                        case let .sessionTaskFailed(sessionError):
                            if let urlError = sessionError as? URLError {
                                if urlError.code == .notConnectedToInternet {
                                    completion(nil, "No internet connection", false)
                                } else {
                                    completion(nil, urlError.localizedDescription, false)
                                }
                            }else {
                                completion(nil, sessionError.localizedDescription, false)
                            }
                        default:
                            completion(nil, "Unknown error", false)
                    }
            }
        }
    }
    
    func parseError(data: NSDictionary) {
        
    }
}

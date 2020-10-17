//
//  ViewController.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit

class HomeVC: UIViewController {
    var competiton: CompetitionTeamsVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        CompetitionTeamsVM.getCompetitionTeams(teamID: 2000) { responce in
            
        }
    }


}


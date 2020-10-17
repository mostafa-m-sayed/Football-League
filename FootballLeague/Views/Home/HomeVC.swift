//
//  ViewController.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit
import Spruce

class HomeVC: UIViewController {
    var competiton: CompetitionTeamsVM!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        CompetitionTeamsVM.getCompetitionTeams(teamID: 2000) { responce in
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.spruce.animate([.slide(.up, .byPoints(-20))], duration: 0.2, completion: nil)
        view.spruce.animate([.slide(.up, .byPoints(-30))], duration: 0.4, completion: nil)
    }
    func registerTableViewCell()  {
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
        tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        }
}



extension HomeVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        return cell
    }
    
    
}

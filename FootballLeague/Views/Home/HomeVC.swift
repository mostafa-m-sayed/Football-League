//
//  ViewController.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit
import Spruce
import NotificationBannerSwift
class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var competiton: CompetitionTeamsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.initNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    func loadData()  {
        CompetitionTeamsVM.getCompetitionTeams(competitionsId: 2000) { result, error, cached  in
            if result != nil {
                self.competiton = result
                self.tableView.reloadData()
                if !cached {
                    self.animateView()
                }
            } else {
                let banner = NotificationBanner(title: "Error", subtitle: error ?? "Unknown error", style: .danger)
                banner.show()
            }
        }
    }
    
    func animateView() {
        self.tableView.spruce.animate([.slide(.up, .byPoints(-20))], duration: 0.2, completion: nil)
        self.view.spruce.animate([.slide(.up, .byPoints(-30))], duration: 0.4, completion: nil)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.competiton?.teams.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        if let competiton = competiton {
            cell.team = competiton.teams[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(identifier: "TeamVC") as! TeamVC
        if let competiton = competiton {
            nextVC.teamId = competiton.teams[indexPath.row].id
            nextVC.teamName = competiton.teams[indexPath.row].name
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

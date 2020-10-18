//
//  ViewController.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit
import Spruce

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var competiton: CompetitionTeamsVM!
    override func viewDidLoad() {
        super.viewDidLoad()
         registerTableViewCell()
        initNavigationBar()
         loadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        animateView()
    }
  
    func registerTableViewCell()  {
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
        tableView.separatorStyle = .none
       
        }
    func initNavigationBar() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let titleDict = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font:UIFont.italicSystemFont(ofSize: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
    }
    func loadData()  {
        CompetitionTeamsVM.getCompetitionTeams(teamID: 2000) { result,error  in
            if result != nil {
                self.competiton = result
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
                self.animateView()
            }
        }
    }
    func animateView()  {
        self.tableView.spruce.animate([.slide(.up, .byPoints(-20))], duration: 0.2, completion: nil)
        self.view.spruce.animate([.slide(.up, .byPoints(-30))], duration: 0.4, completion: nil)
    }
}



extension HomeVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.competiton.teams.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        cell.team =  self.competiton.teams[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

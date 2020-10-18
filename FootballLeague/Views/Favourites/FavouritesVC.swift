//
//  FavouritesVC.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import UIKit

class FavouritesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var favourites: [TeamVM]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.initNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    func animateView() {
        self.tableView.spruce.animate([.slide(.up, .byPoints(-20))], duration: 0.2, completion: nil)
        self.view.spruce.animate([.slide(.up, .byPoints(-30))], duration: 0.4, completion: nil)
    }
    
    func getData() {
        favourites = TeamVM.getFavourites()
        animateView()
        tableView.reloadData()
    }
}
extension FavouritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favourites?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        
        if let favourites = favourites {
            cell.team = favourites[indexPath.row]
            cell.delegate = self
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(identifier: "TeamVC") as! TeamVC
        if let fav = favourites {
            nextVC.teamId = fav[indexPath.row].id
            nextVC.teamName = fav[indexPath.row].name
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
extension FavouritesVC: TeamFavouriteDelegate {
    func favouriteTapped() {
        getData()
    }
}

//
//  TeamVC.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import UIKit
import NotificationBannerSwift

class TeamVC: UIViewController {

    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var competetionsView: UIView!
    @IBOutlet weak var competetionsBarView: UIView!
    @IBOutlet weak var competetionsLabel: UILabel!
    
    @IBOutlet weak var playersView: UIView!
    @IBOutlet weak var playersBarView: UIView!
    @IBOutlet weak var playersLabel: UILabel!

    var activeTab: TeamActiveTab = .competetions
    var teamId: Int?
    var teamName: String?
    var team: TeamVM?
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestures()
        team = TeamVM(team: Team())
        getData()
        initNavBar()
        collectionView.register(UINib(nibName: "PlayerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PlayerCollectionCell")
        collectionView.register(UINib(nibName: "CompetetionCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CompetetionCollectionCell")
    }
    
    func getData() {
        team?.getteam(teamID: String(teamId ?? 0)) {team, error in
            if team != nil {
                self.team = team
                self.noDataVisibility()
                self.collectionView.reloadData()
            } else {
                let banner = NotificationBanner(title: "Error", subtitle: error ?? "Unknown error", style: .danger)
                banner.show()
            }
        }
    }

    @objc func competetionsTabbed() {
        switchTab(tab: .competetions)
    }
    
    @objc func playersTabbed() {
        switchTab(tab: .players)
    }
    
    func switchTab(tab: TeamActiveTab) {
        playersBarView.isHidden = tab != .players
        competetionsBarView.isHidden = tab != .competetions

        playersLabel.textColor = tab == .players ? UIColor(named: "Main") : UIColor.gray
        competetionsLabel.textColor = tab == .competetions ? UIColor(named: "Main") : UIColor.gray
        self.activeTab = tab
        noDataVisibility()
        collectionView.reloadData()
    }
    
    func addGestures() {
        let comGesture = UITapGestureRecognizer(target: self, action: #selector(competetionsTabbed))
        competetionsView.addGestureRecognizer(comGesture)

        let playerGesture = UITapGestureRecognizer(target: self, action: #selector(playersTabbed))
        playersView.addGestureRecognizer(playerGesture)
    }
    
    func initNavBar() {
        self.navigationController?.initNavigationBar()
        self.navigationItem.title = teamName
    }
    
    func noDataVisibility() {
        guard let team = team else { return }
        if activeTab == .players {
            noDataLabel.isHidden = team.players.count != 0
            collectionView.isHidden = team.players.count == 0
        } else {
            noDataLabel.isHidden = team.activeCompetetion.count != 0
            collectionView.isHidden = team.activeCompetetion.count == 0
        }
    }
}

extension TeamVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activeTab == .players ? (team?.players.count ?? 0) : (team?.activeCompetetion.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if activeTab == .competetions {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompetetionCollectionCell", for: indexPath) as! CompetetionCollectionCell
            cell.competetion = team?.activeCompetetion[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionCell", for: indexPath) as! PlayerCollectionCell
            cell.player = team?.players[indexPath.row]
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionSize = collectionView.frame.size
        return CGSize(width: collectionSize.width / 2.1, height: activeTab == .players ? 190 : 170)
    }
}

enum TeamActiveTab {
    case competetions
    case players
}

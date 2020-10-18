//
//  LeagueCell.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit

class LeagueCell: UITableViewCell {
    
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var venuLabel: UILabel!
    @IBOutlet weak var tlaLabel: UILabel!
    
    var team: TeamVM? {
        didSet{
            self.bindData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func bindData() {
        guard let team = team else { return }
        nameLabel.text =  team.name
        websiteLabel.text =  team.website
        tlaLabel.text = team.tla
        venuLabel.text = team.venue
        favouriteButton.setImage(UIImage(systemName: team.isFavourite ? "heart.fill" : "heart"), for: .normal)
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        guard let team = team else { return }
        favouriteButton.setImage(UIImage(systemName: team.isFavourite ?  "heart": "heart.fill"), for: .normal)
        team.isFavourite ? team.removeFavourite() : team.addToFavourites()
    }
}

//
//  LeagueCell.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit
import NotificationBannerSwift

protocol TeamFavouriteDelegate: class {
    func favouriteTapped()
}
class LeagueCell: UITableViewCell {
    
    @IBOutlet weak var colorsStack: UIStackView!
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
    
    weak var delegate: TeamFavouriteDelegate?
    
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
        
        for view in self.colorsStack.subviews {
            view.removeFromSuperview()
        }
        for color in team.clubColors {
            let vw = UIView()
            vw.addShadow(color: .gray, radius: 1,x: 0, y: 2)
            vw.backgroundColor = color
            colorsStack.addArrangedSubview(vw)
        }
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        guard let team = team else { return }
        favouriteButton.setImage(UIImage(systemName: team.isFavourite ?  "heart": "heart.fill"), for: .normal)
        team.isFavourite ? team.removeFavourite() : team.addToFavourites()
        showFavBanner(added: team.isFavourite)
        delegate?.favouriteTapped()
    }
    
    func showFavBanner(added: Bool) {
        let banner = NotificationBanner(title: "Success", subtitle: added ? "Added to favourites" : "Removed from favourites", style: .success)
        banner.show()
    }
}

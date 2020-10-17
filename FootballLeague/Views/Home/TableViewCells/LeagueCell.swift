//
//  LeagueCell.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var venuLabel: UILabel!
    @IBOutlet weak var tlaLabel: UILabel!
    var team : TeamVM! {
        didSet{
            guard let _ = team else {
                return
            }
            self.bindData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func bindData()  {
        self.nameLabel.text =  self.team.name
        self.websiteLabel.text =  self.team.website
        self.tlaLabel.text = self.team.tla
        self.venuLabel.text = self.team.venue
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

//
//  PlayerCollectionCell.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import UIKit

class PlayerCollectionCell: UICollectionViewCell {
    @IBOutlet weak var containerView: CardView!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    var player: PlayerVM? {
        didSet {
            bindData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addShadow(color: UIColor.gray, radius: 5)
    }

    func bindData() {
        guard let player = player else { return }
        playerNumberLabel.text = player.shirtNumber
        nameLabel.text = player.name
        birthdayLabel.text = player.dateOfBirth
        positionLabel.text = "\(player.role)\(player.position == "" ? "" : " - \(player.position)")"
        nationalityLabel.text = player.nationality
    }
}

//
//  CompetetionCollectionCell.swift
//  FootballLeague
//
//  Created by Mostafa Sayed on 10/18/20.
//

import UIKit

class CompetetionCollectionCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var planLabel: UILabel!
    var competetion: CompetetionVM? {
        didSet {
            bindData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func bindData() {
        guard let competetion = competetion else { return}
        nameLabel.text = competetion.name
        locationLabel.text = competetion.area.name
        planLabel.text = competetion.plan
    }
}

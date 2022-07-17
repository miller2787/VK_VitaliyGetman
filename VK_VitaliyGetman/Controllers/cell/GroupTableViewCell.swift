//
//  GroupTableViewCell.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 13.06.2022.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

 
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }
    
    func configure(_ group: Group) {
        fotoImageView.image = UIImage(named: group.avatar)
        fotoImageView.layer.cornerRadius = 30
        nameLabel.text = group.name
        if let description = group.description {
            descriptionLabel.text =  description
            descriptionLabel.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        } else {
            descriptionLabel.text =  "no description"
            descriptionLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

        }
    }
}

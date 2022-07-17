//
//  CustomTableViewCell.swift
//  qwerty
//
//  Created by Гетьман Виталий on 09.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var closure: (() -> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
        nameLabel.text = nil
        lastNameLabel.text = nil
        descriptionLabel.text = nil
        closure = nil
    }
    
    func configure(image: UIImage?, name: String?, lastName: String?, description: String?, closure: @escaping () -> Void) {
        fotoImageView.image = image
        fotoImageView.layer.cornerRadius = 30
        nameLabel.text = name
        lastNameLabel.text = lastName
        self.closure = closure
        if let description = description {
            descriptionLabel.text =  description
            descriptionLabel.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        } else {
            descriptionLabel.text =  "no description"
            descriptionLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

        }
    }

    
    @IBAction func pressImageViewButton(_ sender: UIButton) {
    
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.toValue = 0.1
        
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.fotoImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { [weak self] _ in
            self?.closure?()
        }
  
    
    }
}

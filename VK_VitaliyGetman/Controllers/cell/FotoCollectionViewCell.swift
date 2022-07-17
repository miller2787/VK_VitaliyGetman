//
//  FotoCollectionViewCell.swift
//  CollectionTest
//
//  Created by Гетьман Виталий on 12.06.2022.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var likeControlView: LikeControlView!
    
    var onLikeClosure: ((Bool, Int) -> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
        likeControlView.configure(isLiked: false, counter: 0)
        onLikeClosure = nil
    }

    func configure(image: UIImage?, isLiked: Bool, likeCounter: Int, onLikeClosure: @escaping (Bool, Int) -> Void) {
        fotoImageView.image = image
        likeControlView.configure(isLiked: isLiked, counter: likeCounter)
        likeControlView.delegate = self
        self.onLikeClosure = onLikeClosure
    }
    
//    @IBAction func pressToImage(_ sender: UIButton) {
//    
//    }
    
}

extension FotoCollectionViewCell: LikeControlProtocol {
    func pressLike(likeState: Bool, currentCounter: Int) {
        self.onLikeClosure?(likeState, currentCounter)
    }
    
    
}

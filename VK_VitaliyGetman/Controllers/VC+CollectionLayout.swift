//
//  VC+CollectionLayout.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 13.06.2022.
//

import UIKit

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let whiteSpaces: CGFloat = 10
        let cellWigth = width / 3 - whiteSpaces
        
        return CGSize(width: cellWigth, height: cellWigth + 40)
    }
}


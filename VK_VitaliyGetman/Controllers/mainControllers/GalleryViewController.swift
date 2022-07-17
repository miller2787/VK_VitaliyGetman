//
//  GalleryViewController.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 13.06.2022.
//

import UIKit


class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let fotoCollectionViewCellReuseIdentifier = "fotoCollectionViewCellReuseIdentifier"
    var fotoAlbumIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "FotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: fotoCollectionViewCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}


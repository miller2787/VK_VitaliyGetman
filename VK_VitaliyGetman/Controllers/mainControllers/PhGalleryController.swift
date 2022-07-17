//
//  PhGalleryController.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 19.06.2022.
//

import UIKit

class PhGalleryController: UIViewController {

    
    @IBOutlet weak var galleryView: PhGallery!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let images = [UIImage(named: "ivan")!, UIImage(named: "petya")!, UIImage(named: "sveta")!, UIImage(named: "cat")!, UIImage(named: "dog")!, UIImage(named: "hamster")!]
        galleryView.setImages(images: images)
    }
}


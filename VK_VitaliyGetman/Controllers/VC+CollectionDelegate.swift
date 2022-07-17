//
//  VC+CollectionDelegate.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 13.06.2022.
//

import UIKit

extension MyGroupViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
}

extension AllGroupController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let group = groups[indexPath.item]
            NotificationCenter.default.post(name: Notification.Name("pressToGroup"), object: group)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
}

extension MyFriendsController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == fromFriendListToGallerySegue,
           let destinationController = segue.destination as? GalleryViewController,
           let fotoArrayIndex = sender as? Int {
            
            destinationController.fotoAlbumIndex = fotoArrayIndex
        }
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let fotos = myFriends[indexPath.row].fotoAlbum
//
//        performSegue(withIdentifier: fromFriendListToGallerySegue, sender: fotos)
//    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        let fullScreenView = UIView(frame: self.view.bounds)
        let fullScreenImageView = UIImageView(frame: fullScreenView.frame)
        fullScreenView.addSubview(fullScreenImageView)
        let image = Storage.shared.friends[fotoAlbumIndex].fotoAlbum[indexPath.item].url
        fullScreenImageView.image = UIImage(named: image)
        fullScreenImageView.contentMode = .scaleAspectFit
        self.view.addSubview(fullScreenView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        fullScreenView.addGestureRecognizer(tap)
    }
    
    @objc func onTap(_ recognizer: UITapGestureRecognizer) {
        guard let targetView = recognizer.view else { return }
        targetView.removeFromSuperview()
    }
}
        
        
        
        
//        let view = UIView(frame: self.view.frame)
//        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//        let imageView = UIImageView(frame: view.frame)
//        self.view.addSubview(view)
//        view.addSubview(imageView)
//        imageView.image = UIImage(named: fotoAlbum[indexPath.item])
//        imageView.contentMode = .scaleAspectFit
//    }
//}

extension MyFriendsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            myFriends = Storage.shared.friends
        }
        else {
            myFriends = Storage.shared.friends.filter({ friendItem in
                friendItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}


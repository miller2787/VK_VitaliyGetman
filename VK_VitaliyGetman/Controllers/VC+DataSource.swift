//
//  VC+DataSource.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 13.06.2022.
//

import UIKit

extension MyGroupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupTableViewCellReuse, for: indexPath) as! GroupTableViewCell
        
        cell.configure(self.groups[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                groups.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension AllGroupController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupTableViewCellReuse, for: indexPath) as! GroupTableViewCell
        
        cell.configure(self.groups[indexPath.row])
        
        return cell
    }
}

extension MyFriendsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuseIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let friend = myFriends[indexPath.row]
        
        cell.configure(image: UIImage(named: friend.avatar!), name: friend.name, lastName: friend.lastName, description: friend.age, closure: { [weak self] in
            guard let self = self else {return}
            self.performSegue(withIdentifier: self.fromFriendListToGallerySegue, sender: indexPath.row)
        })
        return cell
    }
    
}

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Storage.shared.friends[fotoAlbumIndex].fotoAlbum.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fotoCollectionViewCellReuseIdentifier, for: indexPath) as! FotoCollectionViewCell
        
        let localFotoAlbumIndex = fotoAlbumIndex
        let currentFotoAlbum = Storage.shared.friends[localFotoAlbumIndex].fotoAlbum
        
        let image = UIImage(named: currentFotoAlbum[indexPath.item].url)
        
        cell.configure(image: image, isLiked: currentFotoAlbum[indexPath.item].isLiked, likeCounter: currentFotoAlbum[indexPath.item].likeCounter, onLikeClosure: { isLikePressed, currentCounter in
                print("counter \(currentCounter)")
                print(isLikePressed ? "true" : "false")
                Storage.shared.friends[localFotoAlbumIndex].fotoAlbum[indexPath.item].isLiked = isLikePressed
                Storage.shared.friends[localFotoAlbumIndex].fotoAlbum[indexPath.item].likeCounter = currentCounter
            })
        
        return cell
    }
}

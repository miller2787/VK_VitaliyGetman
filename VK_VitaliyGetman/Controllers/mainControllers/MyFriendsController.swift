//
//  MyFriendsController.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 05.06.2022.
//

import UIKit

class MyFriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    let fromFriendListToGallerySegue = "fomFriendListToGallery"
    
    var sourceFriends = [Friend]()
    var myFriends = [Friend]()
    let customTableViewCellReuseIdentifier = "customTableViewCellReuseIdentifier"
    var letersOfNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriends = Storage.shared.friends
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuseIdentifier)
        searchBar.delegate = self
    }
}





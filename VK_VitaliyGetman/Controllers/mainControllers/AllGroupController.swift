//
//  AllGroupController.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 05.06.2022.
//

import UIKit

class AllGroupController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    func fillData() -> [Group] {
        let group1 = Group(name: "Клуб любителей кошек", description: "Владивосток", avatar: "cat")
        let group2 = Group(name: "Клуб любителей собак", description: "Москва", avatar: "dog")
        let group3 = Group(name: "Клуб любителей хомяков", description: "Новосибирск", avatar: "hamster")
        
        var groups = [Group]()
        groups.append(group1)
        groups.append(group2)
        groups.append(group3)
        return groups
    }
    
    var groups = [Group]()
    let groupTableViewCellReuse = "groupTableViewCellreuse"

    override func viewDidLoad() {
        super.viewDidLoad()
        groups = fillData()
        tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: groupTableViewCellReuse)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

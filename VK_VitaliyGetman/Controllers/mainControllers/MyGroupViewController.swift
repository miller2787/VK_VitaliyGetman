//
//  MyGroupViewController.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 13.06.2022.
//

import UIKit

class MyGroupViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var groups = [Group]()
    let groupTableViewCellReuse = "groupTableViewCellreuse"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: groupTableViewCellReuse)
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didPressToGroup(_:)), name: Notification.Name("pressToGroup"), object: nil)
    }
    @objc func didPressToGroup(_ notification: Notification) {
        guard let group = notification.object as? Group else { return }
        
        if !groups.contains(where: { groupItem in
            groupItem.name == group.name
        }) {
            groups.append(group)
            tableView.reloadData()
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
}

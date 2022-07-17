//
//  Storage.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 18.06.2022.
//

import UIKit

class Storage: NSObject {
    static let shared = Storage()
    private override init() {
        super.init()
    }
    var friends = [Friend]()
    var index = Int()
}

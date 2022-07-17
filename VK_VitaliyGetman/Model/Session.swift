//
//  Session.swift
//  VK_VitaliyGetman
//
//  Created by Гетьман Виталий on 17.07.2022.
//

import Foundation

class Session {
    
    private init() {}
    static let instance = Session()
    
    var token = ""
    var userID = 0
}

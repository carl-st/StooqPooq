//
//  SettingsModel.swift
//  StooqPooq
//
//  Created by Karol Stępień on 05.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Settings: Object {
    
    dynamic var id = 0
    dynamic var timerInterval = 30
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        timerInterval <- map["timerInterval"]
    }
    
}

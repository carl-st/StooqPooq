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
    
    dynamic var id = 0 // We're storing only one settings object
    dynamic var timerInterval = 30
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(timerInterval: Int) {
        self.init()
        self.timerInterval = timerInterval
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        timerInterval <- map["timerInterval"]
    }
    
}

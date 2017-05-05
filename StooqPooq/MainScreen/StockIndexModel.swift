//
//  StockIndexModel.swift
//  StooqPooq
//
//  Created by Karol Stępień on 02.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import RealmSwift
import ObjectMapper

class StockIndex: Object {
    
    dynamic var name = ""
    dynamic var time = ""
    dynamic var value: Double = 0.0
    dynamic var updated = Date()
    
    convenience init(withName name: String, value: Double, andTime time: String) {
        self.init()
        self.name = name
        self.value = value
        self.time = time
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        time <- map["time"]
        value <- map["value"]
    }
    
}

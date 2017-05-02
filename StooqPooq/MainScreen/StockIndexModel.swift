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
    
    private var id = ""
    private var name = ""
    private var value: Double = 0.0
    
    convenience init(withName name: String, andValue value: Double) {
        self.init()
        self.name = name
        self.value = value
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        value <- map["value"]
    }
    
    
}

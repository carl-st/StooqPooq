//
//  Date+StooqPooq.swift
//  StooqPooq
//
//  Created by Karol Stępień on 05.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import Foundation

extension Date {
    func isBetween(date date1: Date, andDate date2: Date) -> Bool {
        return date1.compare(self) == self.compare(date2)
    }
}

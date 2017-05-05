//
//  StocksViewModel.swift
//  StooqPooq
//
//  Created by Karol Stępień on 02.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import RealmSwift

class StocksViewModel {
    var stocksNotificationToken: NotificationToken? = nil
    var persistenceManager: PersistenceManager
    var reload: (() -> Void)?
    var stocks: [StockIndex] = []
    
    init(reload: (() -> Void)? = nil, persistence: PersistenceManager = PersistenceManager.sharedInstance) {
        self.reload = reload
        self.persistenceManager = persistence
        self.stocks = Array(persistence.getStocks())
        
        let realm = try! Realm()
        let results = realm.objects(StockIndex.self)
        stocksNotificationToken = results.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            guard let reload = reload else {
                return
            }
            switch changes {
            case .initial:
                break
            case .update(_, _, _, _):
                self?.stocks = Array(persistence.getStocks())
                
                reload()
                break
            case .error(let error):
                fatalError("\(error)")
                
                break
            }
        }
    }
    
    deinit {
        stocksNotificationToken?.stop()
    }
    
}

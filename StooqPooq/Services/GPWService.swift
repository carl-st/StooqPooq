//
//  GPWService.swift
//  StooqPooq
//
//  Created by Karol Stępień on 02.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import Fuzi


class GPWService {
    
    private let indexNamesXPathQuery = "//a[@id='pp_s']"
    private let indexValuesXPathQuery = "//td[@id='pp_v']"
    private let indexTimeXPathQuery = "//td[@id='pp_d']"
    private let gpwIndexUrl = "https://static.stooq.com/pp/g.js"
    
    private var indexNames: [String] = []
    private var indexValues: [Double] = []
    private var indexTimes: [String] = []
    private var stockObjects: [StockIndex] = []
    
    static let sharedInstance = GPWService()
    
    func fetchGPW() {
        do {
        let data = try Data(contentsOf: URL(string: gpwIndexUrl)!, options: NSData.ReadingOptions.alwaysMapped)
            
            guard let html = String(data: data, encoding: .utf8) else { return }
            
                let doc = try HTMLDocument(string: html, encoding: String.Encoding.utf8)
                
                for anchor in doc.xpath(indexNamesXPathQuery) {
                    print(anchor.stringValue)
                    indexNames.append(anchor.stringValue)
                }
                
                for anchor in doc.xpath(indexValuesXPathQuery) {
                    print(anchor.stringValue)
                    if let indexValue = Double(anchor.stringValue) {
                        indexValues.append(indexValue)
                    }
                }
                
                for anchor in doc.xpath(indexTimeXPathQuery) {
                    print(anchor.stringValue)
                    indexTimes.append(anchor.stringValue)
                }
            
                let stocks = PersistenceManager.sharedInstance.getStocks()
                for (index, indexName) in indexNames.enumerated() {
                    let newStockIndex = StockIndex(withName: indexName, value: indexValues[index], andTime: indexTimes[index])
                    if stocks.count > 0 {
                        for stock in stocks {
                            if stock.name == indexName && indexValues[index] != stock.value {
                                newStockIndex.difference = indexValues[index] - stock.value
                                stockObjects.append(newStockIndex)
                                break
                            }
                        }
                    } else {
                        stockObjects.append(newStockIndex)
                    }
                }
            
                PersistenceManager.sharedInstance.createOrUpdate(stockObjects)

        } catch let error {
            print(error)
        }
        
    }
    
}

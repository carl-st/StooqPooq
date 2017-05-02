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
    private let gpwIndexUrl = "https://static.stooq.com/pp/g.js"
    
    private var indexNames: [String] = []
    private var indexValues: [Double] = []
    
    func fetchGPW() {
        do {
        let data = try Data(contentsOf: URL(string: gpwIndexUrl)!, options: NSData.ReadingOptions.alwaysMapped)
            
            guard let html = String(data: data, encoding: .utf8) else { return }
            
            do {
                let doc = try HTMLDocument(string: html, encoding: String.Encoding.utf8)
                
                for anchor in doc.xpath(indexNamesXPathQuery) {
                    print(anchor.stringValue)
                    indexNames.append(anchor.stringValue)
                }
                
                for anchor in doc.xpath(indexValuesXPathQuery) {
                    print(anchor.stringValue)
                    if let indexValue = anchor.numberValue as? Double {
                        indexValues.append(indexValue)
                    }
                }
                
                for (index, indexName) in indexNames.enumerated() {
                    let stock = StockIndex(withName: indexName, andValue: indexValues[index])
                    PersistenceManager.sharedInstance.createOrUpdate(stock)
                }
                
            } catch let error {
                print(error)
            }
        } catch let error {
            print(error)
        }
        
    }
    
}

//
//  ViewController.swift
//  StooqPooq
//
//  Created by Karol Stępień on 29.04.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit
import Fuzi

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let data = try! Data(contentsOf: URL(string:"https://static.stooq.com/pp/g.js")!, options: NSData.ReadingOptions.alwaysMapped)
        
        let html = String(data: data, encoding: .utf8)!
    
        do {
            let doc = try HTMLDocument(string: html, encoding: String.Encoding.utf8)
            
            for anchor in doc.xpath("//td[@id='pp_v']") {
                print(anchor.stringValue)
            }
            
            for anchor in doc.xpath("//a[@id='pp_s']") {
                print(anchor.stringValue)
            }
            
        } catch let error {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


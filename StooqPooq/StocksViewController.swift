//
//  StocksViewController.swift
//  StooqPooq
//
//  Created by Karol Stępień on 29.04.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}


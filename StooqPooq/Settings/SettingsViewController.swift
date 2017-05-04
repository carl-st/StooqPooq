//
//  SettingsViewController.swift
//  StooqPooq
//
//  Created by Karol Stępień on 04.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.layer.borderWidth = 5.0
        timerLabel.layer.borderColor = UIColor.white.cgColor
        timerLabel.layer.cornerRadius = timerLabel.frame.width / 2
    }

    override func viewWillDisappear(_ animated: Bool) {
        // save settings
    }


}

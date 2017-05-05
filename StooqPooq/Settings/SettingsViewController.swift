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
    @IBOutlet var footerLabel: UILabel!
    @IBOutlet var timerStepper: UIStepper!
    
    var timerCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        
        timerLabel.layer.borderWidth = 5.0
        timerLabel.layer.borderColor = UIColor.white.cgColor
        timerLabel.layer.cornerRadius = timerLabel.frame.width / 2
        
        let displayName = Bundle.main.infoDictionary!["CFBundleName"] as! String
        let build = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        footerLabel.text = "\(displayName) v\(version) (\(build))"
        
        if let settings = PersistenceManager.sharedInstance.getSettings() {
            timerCounter = settings.timerInterval
            timerLabel.text = "\(timerCounter)s"
            timerStepper.value = Double(timerCounter)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        let newSettings = Settings(timerInterval: timerCounter)
        PersistenceManager.sharedInstance.createOrUpdate(newSettings)
    }

    @IBAction func stepperAction(_ sender: Any) {
        timerCounter = Int(timerStepper.value)
        timerLabel.text = "\(timerCounter)s"
    }

}

//
//  Appearance.swift
//  StooqPooq
//
//  Created by Karol Stępień on 04.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func applyAppearance() {
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: "Futura", size: 20.0)!,
                                                            NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().barTintColor = Colors.accent
        UITabBar.appearance().barTintColor = Colors.accent
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance()
//        UIBarButtonItem.appearance().tintColor = Colors.accent

    }
    
}

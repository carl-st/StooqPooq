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
        UINavigationBar.appearance().tintColor = Colors.primary
        UINavigationBar.appearance().barTintColor = Colors.accent
        UITabBar.appearance().barTintColor = Colors.primary
        UITabBar.appearance().tintColor = Colors.accent
        UITabBar.appearance().backgroundColor = Colors.primary
//        UITabBar.appearance()
//        UIBarButtonItem.appearance().tintColor = Colors.accent

    }
    
}

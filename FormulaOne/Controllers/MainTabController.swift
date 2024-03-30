//
//  MainTabController.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

class MainTabController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewControllers()
    }
    
    func setUpViewControllers() {
        viewControllers = [
            
            createNavigationController(for: ScheduleViewController(), title: "Schedule", imageName: "flag.checkered.2.crossed"),
            createNavigationController(for: UIViewController(), title: "Pilots", imageName: "house.fill"),
        ]
    }
    
    
    fileprivate func createNavigationController(for rootViewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image =  UIImage(systemName: imageName)
        return navController
    }
    
}

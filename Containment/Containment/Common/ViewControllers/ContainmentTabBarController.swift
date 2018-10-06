//
//  ContainmentTabBarController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class ContainmentTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        viewControllers = [firstTabBarViewController(), secondTabBarViewController(), thirdTabBarViewController()]
    }
    
    func firstTabBarViewController() -> UIViewController {
        
        let vc = HomeContainerViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.tabBarItem.title = "First"
        return nvc
    }
    
    func secondTabBarViewController() -> UIViewController {
        
        let vc = HomeContainerViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.tabBarItem.title = "Second"
        return nvc
    }
    
    func thirdTabBarViewController() -> UIViewController {
        
        let vc = HomeContainerViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.tabBarItem.title = "Third"
        return nvc
    }
}

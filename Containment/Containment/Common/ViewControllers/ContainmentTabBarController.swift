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
        vc.tabBarItem.title = "First"
        return vc
    }
    
    func secondTabBarViewController() -> UIViewController {
        
        let vc = HomeContainerViewController()
        vc.tabBarItem.title = "Second"
        return vc
    }
    
    func thirdTabBarViewController() -> UIViewController {
        
        let vc = HomeContainerViewController()
        vc.tabBarItem.title = "Third"
        return vc
    }
}

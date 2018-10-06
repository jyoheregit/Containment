//
//  HomeContainerViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class HomeContainerViewController : BaseContainerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home1"
        fetchData()
    }
    
    func showHomeViewController(items : Array<Int>) {
        
        let homeViewController = HomeViewController()
        homeViewController.items = items
        self.containerStateViewController.transition(to: .render(homeViewController))
    }
    
    func fetchData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 20]
            self.showHomeViewController(items: items)
        }
    }
}

//
//  HomeViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class HomeViewController : BaseTableViewController{
    
    var items: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.dataSource = HomeDataSource(items: items)
    }
}

//
//  BaseTableViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

//class BaseTableViewController : UIViewController, UITableViewDataSource {
//
//    var dataSource : UITableViewDataSource? { didSet {self.tableView.reloadData()} }
//
//    lazy var tableView : UITableView = {
//        let tableView = UITableView()
//        tableView.dataSource = self
//        return tableView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addSubview(tableView)
//        tableView.matchSuperView()
//        registerCell()
//    }
//
//    func registerCell() {
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//    }
//}
//
//extension BaseTableViewController {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let dataSource = dataSource else { fatalError("Data Source Not Set") }
//        return dataSource.tableView(tableView, numberOfRowsInSection: section)
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let dataSource = dataSource else { fatalError("Data Source Not Set") }
//        return dataSource.tableView(tableView, cellForRowAt: indexPath)
//    }
//}


import Foundation
import UIKit

class BaseTableViewController: UIViewController {
        
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.matchSuperView()
    }
}




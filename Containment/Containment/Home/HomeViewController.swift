//
//  HomeViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class HomeViewController : BaseTableViewController {
    
    private lazy var viewHelper = TableViewHelper<Model>()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        self.title = "Home"
        tableView.dataSource = viewHelper
        tableView.delegate = viewHelper
      
        tableView.register(TextCell.self, forCellReuseIdentifier: NSStringFromClass(TextCell.self))
        viewHelper.items = [Model(value: 1), Model(value: 2)]
        tableView.reloadData()
    }
}

struct Model : BaseModel {
    
    var value : Int
    var cellType: TableViewCellType {
        return .Text
    }
}

class TextCell : UITableViewCell, ConfigureCellProtocol{
    
    func configureCell<T>(with model: T) where T : BaseModel {
        
        if let item = model as? Model {
            self.item = item
        }
    }
    
    var item : Model? {
        
        didSet {
            guard let item = self.item else { return }
            self.textLabel?.text = "\(item.value)"
        }
    }
}



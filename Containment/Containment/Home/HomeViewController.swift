//
//  HomeViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class HomeViewController : BaseTableViewController {
        
    override func viewDidLoad(){
        
        super.viewDidLoad()
      
        tableView.register(TextCell.self, forCellReuseIdentifier: NSStringFromClass(TextCell.self))
        tableView.register(DetailCell.self, forCellReuseIdentifier: NSStringFromClass(DetailCell.self))

        viewHelper.items = [Model(value: 1), Model(value: 2), DetailModel(value: 3, detailValue: "Three")]
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if var items = self.viewHelper.items {
                items += [Model(value: 4), Model(value: 5), DetailModel(value: 6, detailValue: "Six")] as! [BaseModel]
                self.viewHelper.items = items
            }
            self.tableView.reloadData()
        }
    }
}

struct Model : BaseModel {
    
    var value : Int
    var cellType: TableViewCellType {
        return .Text
    }
}

struct DetailModel : BaseModel {
    
    var value : Int
    var detailValue : String
    var cellType: TableViewCellType {
        return .Detail
    }
}

class DetailCell : UITableViewCell, ConfigureCellProtocol {
    
    func configureCell(with model: BaseModel) {
        if let item = model as? DetailModel {
            self.item = item
        }
    }
    
    var item : DetailModel? {
        
        didSet {
            guard let item = self.item else { return }
            self.textLabel?.text = "\(item.value) - " +  item.detailValue
        }
    }
    
    
}

class TextCell : UITableViewCell, ConfigureCellProtocol{
    
    func configureCell(with model: BaseModel) {
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



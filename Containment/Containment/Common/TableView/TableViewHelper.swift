//
//  TableViewHelper.swift
//  Containment
//
//  Created by Joe on 08/10/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewHelperProtocol : UITableViewDataSource, UITableViewDelegate {
    
    var items : [BaseModel]? {get set}
}

class TableViewHelper : NSObject, TableViewHelperProtocol  {
    
    var items: [BaseModel]? {
        
        get {
            return self.model
        }
        set {
            self.model = newValue
        }
    }
    
    private var model : [BaseModel]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = self.model else { return 0 }
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let model = self.model else { fatalError("Model is nil when returning cell")}
       
        let cellType = model[indexPath.row].cellType
        let cellClass : UITableViewCell.Type = cellType.cellClass()
        guard cellType != .None,
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(cellClass)) else {
                fatalError("Error Dequeing Cell")
        }
        if let cell = cell.self as? ConfigureCellProtocol {
            cell.configureCell(with: model[indexPath.row])
        }
        return cell
    }
}



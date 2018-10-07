//
//  TableViewHelper.swift
//  Containment
//
//  Created by Joe on 08/10/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import Foundation
import UIKit

protocol BaseModel {
    var cellType : TableViewCellType {get}
}

protocol ConfigureCellProtocol {
    func configureCell<T : BaseModel>(with model : T)
}

protocol TableViewHelperProtocol : UITableViewDataSource, UITableViewDelegate {
    
    associatedtype T
    var items : [T]? {get set}
}

class TableViewHelper<T:BaseModel> : NSObject, TableViewHelperProtocol  {
    
    var items: [T]? {
        
        get {
            return self.model
        }
        set {
            self.model = newValue
        }
    }
    
    private var model : [T]?
    
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
        if let testcell = cell.self as? ConfigureCellProtocol {
            testcell.configureCell(with: model[indexPath.row])
        }
        return cell
    }
}

enum TableViewCellType : String {
    
    case Text
    case None
    
    func cellClass() -> UITableViewCell.Type {
        
        switch self {
        case .Text: return TextCell.self
        case .None: return UITableViewCell.self
            
        }
        
        
    }
}

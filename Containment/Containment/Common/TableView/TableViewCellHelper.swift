//
//  TableViewCellHelper.swift
//  Containment
//
//  Created by Joe on 10/10/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import Foundation
import UIKit

//All Cell Models adhere to the protocol
protocol BaseModel {
    var cellType : TableViewCellType {get}
}

//All cells adhere to the protocol
protocol ConfigureCellProtocol {
    func configureCell(with model : BaseModel)
}

//Cell type returned based on model
enum TableViewCellType : String {
    
    case Text
    case None
    case Detail
    
    func cellClass() -> UITableViewCell.Type {
        
        switch self {
        case .Text: return TextCell.self
        case .Detail : return DetailCell.self
        case .None: return UITableViewCell.self
        }
    }
}

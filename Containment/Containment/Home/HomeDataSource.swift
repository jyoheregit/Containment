//
//  HomeDataSource.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class HomeDataSource : NSObject, UITableViewDataSource {
    
    var items : [Int]?
    
    init(items : [Int]?) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let items = items else {fatalError("TableView Data is nil")}
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(items[indexPath.row])"
        return cell
    }
}

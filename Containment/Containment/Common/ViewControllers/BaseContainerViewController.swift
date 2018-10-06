//
//  BaseViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class BaseContainerViewController : UIViewController, UISearchBarDelegate {
    
    lazy var containerStateViewController = ContainerStateViewController()
    
    lazy var searchController : UISearchController = {
        let searchController = UISearchController(searchResultsController: HomeViewController())
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(containerStateViewController)
        self.view.backgroundColor = UIColor.white
        self.navigationItem.searchController = searchController
    }
    
    func showErrorViewController(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let error = NSError(domain:"", code:401, userInfo:[ NSLocalizedDescriptionKey: "Error occurred"])
            self.containerStateViewController.transition(to: .error(error))
            self.showTableViewController()
        }
    }
    
    func showTableViewController() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let vc = BaseTableViewController()
            self.containerStateViewController.transition(to: .render(vc))
        }
    }
}

extension BaseContainerViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}

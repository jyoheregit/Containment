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
        let homeVC = HomeViewController()
        let searchController = UISearchController(searchResultsController: homeVC)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search here..."
        //searchController.searchBar.delegate = homeVC
        searchController.searchBar.sizeToFit()
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(containerStateViewController)
        self.view.backgroundColor = UIColor.white
        //self.navigationItem.searchController = searchController
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backgroundColor = .gray
        if let frame = self.navigationController?.navigationBar.frame {
            let navigationView = NavigationView(frame: CGRect(x: 0, y: 0, width: frame.size.width-24, height: frame.size.height))
            navigationView.searchBar.delegate = self
            self.navigationItem.titleView = navigationView
        }
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

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.present(searchController, animated: true, completion: nil)
    }
}

extension BaseContainerViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}

//
//  BaseViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class BaseContainerViewController : UIViewController {
    
    lazy var containerStateViewController = ContainerStateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(containerStateViewController)
        self.view.backgroundColor = UIColor.white
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

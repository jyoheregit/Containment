//
//  UIViewController+Container.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func add(_ viewController: UIViewController) {
        
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.matchSuperView()
        viewController.didMove(toParent: self)
    }
    
     func remove() {
    
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
}

//
//  ContainerStateViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class ContainerStateViewController : UIViewController {
    
    private var state : State?
    private var displayedViewController : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if state == nil {
            transition(to: .loading)
        }
    }
    
    func transition(to newState: State){
        displayedViewController?.remove()
        let toDisplayViewContoller = viewController(for: newState)
        add(toDisplayViewContoller)
        displayedViewController = toDisplayViewContoller
        state = newState
    }
}

extension ContainerStateViewController {
    
    func viewController(for state : State) -> UIViewController{
        
        switch state {
     
        case .loading:
            return UINavigationController(rootViewController: LoadingViewController())
        case .error(let error):
            return UINavigationController(rootViewController: ErrorViewController(error: error))
        case .render(let viewController):
            return viewController
        }
    }
}

extension ContainerStateViewController {
    
    enum State {
        case loading
        case error(Error)
        case render(UIViewController)
    }
}


//
//  LoadingViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class LoadingViewController : UIViewController {
    
    lazy var activityIndicatorView : UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.style = UIActivityIndicatorView.Style.gray
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.center = self.view.center
        return activityIndicatorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(activityIndicatorView)
        self.view.alpha = 0.7
        activityIndicatorView.startAnimating()
    }
}

//
//  ErrorViewController.swift
//  Containment
//
//  Created by Joe on 24/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class ErrorViewController : UIViewController {
    
    var error : Error
    
    lazy var errorLabel : UILabel = {
        let label = UILabel()
        label.text  = error.localizedDescription
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    init(error : Error) {
        self.error = error
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(errorLabel)
        errorLabel.matchSuperView()
    }
}

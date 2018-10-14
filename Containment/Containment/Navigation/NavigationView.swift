//
//  NavigationView.swift
//  Containment
//
//  Created by Joe on 10/10/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class NavigationView : UIView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar  = UISearchBar(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: self.frame.size.width-100, height: frame.size.height))
        searchBar.backgroundColor = .yellow
        return searchBar
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: frame.origin.x + searchBar.frame.size.width, y: frame.origin.y, width: 100, height: frame.size.height))
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        addSearchBar()
        addImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSearchBar() {
        self.addSubview(searchBar)
    }
    
    func addImageView() {
        imageView.backgroundColor = UIColor.blue
        self.addSubview(imageView)
    }
}

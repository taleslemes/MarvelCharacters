//
//  CustomViewController.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 24/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    // MARK: Properties
    
    let navigationTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        label.textColor = .white
        label.font = .Arial(withWeight: .bold, size: 28)
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = navigationTitleLabel
    }
    
}

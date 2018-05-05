//
//  SearchViewController+Constraints.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/5/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

extension SearchViewController {
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    // Set constraints
    let views = ["tableView": tableView]
    var constraints: [NSLayoutConstraint] = []
    let hConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", metrics: [:], views: views)
    let vConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", metrics: [:], views: views)
    constraints.append(contentsOf: hConstraint)
    constraints.append(contentsOf: vConstraint)
    NSLayoutConstraint.activate(constraints)
  }
}

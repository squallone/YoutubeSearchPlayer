//
//  SearchViewController.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/3/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  // MARK: - Properties
  
  let viewModel = SearchViewModel()
  
  // MARK: - Views
  // Table view
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableHeaderView = searchController.searchBar
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)
    return tableView
  }()
  
  // SearchController
  lazy var searchController: UISearchController = {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    searchController.searchBar.barStyle = .black
    return searchController
  }()
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Bind state
    viewModel.bindState { (state) in
      switch state {
      case .fetching:
        break
      case .success:
        break
      default:
        break
      }
    }
  }
  
  deinit {
    viewModel.unbindState()
  }
  
}

// MARK: - UITableView Data Source
extension SearchViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}

// MARK: - UITableView Delegate
extension SearchViewController: UITableViewDelegate {
  
}

// MARK: - UISearchController Updater
extension SearchViewController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    
  }
}

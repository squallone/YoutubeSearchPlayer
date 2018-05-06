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
    tableView.register(SearchItemTableViewCell.self)
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
    viewModel.bindState { [unowned self] (state) in
      switch state {
      case .fetching:
        break
      case .success:
        self.tableView.reloadData()
      default:
        break
      }
    }
    
    viewModel.search(text: "yuya")
  }
  
  deinit {
    viewModel.unbindState()
  }
}

// MARK: - UITableView Data Source
extension SearchViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 230
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.count()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let itemViewModel = viewModel.dataSource[indexPath.row]    
    let cell = tableView.dequeueReusableCell(for: indexPath) as SearchItemTableViewCell
    cell.setup(viewModel: itemViewModel)
    return cell
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

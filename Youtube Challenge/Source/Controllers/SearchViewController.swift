//
//  SearchViewController.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/3/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  struct Constants {
    static let title = "Applicaster Challenge"
  }
  
  // MARK: - Properties
  let viewModel = SearchViewModel()
  
  // MARK: - Views
  // Table view
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorColor = .clear
    tableView.backgroundColor = UIColor.searchBackgroundColor
    tableView.register(SearchItemTableViewCell.self)
    tableView.backgroundView = EmptySearchView.fromNib()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)
    return tableView
  }()
  
  // SearchController
  lazy var searchController: UISearchController = {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.barStyle = .black
    searchController.searchBar.delegate = self
    searchController.searchResultsUpdater = self
    searchController.hidesNavigationBarDuringPresentation = false
    return searchController
  }()
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    
    // Bind state
    viewModel.bindState { [unowned self] (state) in
      switch state {
      case .fetching:
        break
      case .success:
        self.tableView.backgroundView = nil
        self.tableView.reloadData()
      case .clear:
        self.tableView.backgroundView = EmptySearchView.fromNib()
        self.tableView.reloadData()
      case .noSarchResults(let text):
        self.tableView.backgroundView = EmptySearchView.set(text: "Your search \(text) did not match any videos ")
        self.tableView.reloadData()
      default:
        break
      }
    }
  }
  
  deinit {
    viewModel.unbindState()
  }
  
  // MARK: - UI
  // Set UI customization
  func setup() {
    // Search controller
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = true
    definesPresentationContext = true

    // View Controller
    view.backgroundColor = UIColor.searchBackgroundColor
    navigationItem.title = Constants.title
    // NavigationBar customization
    guard let navigationController = navigationController else { return }
    navigationController.navigationBar.prefersLargeTitles = true
    let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    navigationController.navigationBar.titleTextAttributes = attributes
    navigationController.navigationBar.largeTitleTextAttributes = attributes
    navigationController.navigationBar.installBlurEffect()
  }
}

// MARK: - UITableView Data Source
extension SearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 260
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
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let itemViewModel = viewModel.dataSource[indexPath.row]
    let youtubePlayerViewController = YoutubePlayerViewController(itemViewModel: itemViewModel)
    self.navigationController?.pushViewController(youtubePlayerViewController, animated: true)
  }
}

// MARK: - UISearchController Updater
extension SearchViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    if let text = searchController.searchBar.text, !text.isEmpty {
      viewModel.search(text: text)
    }
  }
}

extension SearchViewController: UISearchBarDelegate {
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    viewModel.clearSerch()
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchController.isActive = false
  }
}

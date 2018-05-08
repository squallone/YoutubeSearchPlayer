//
//  SearchViewController+Search.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/8/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

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


//
//  RequestManager.swift
//  YTSearch
//
//  Created by Abdiel Soto on 12/14/17.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import Foundation


class RequestManager {
  // MARK: - Properties
  private let networkDispatcher: Dispatcher

  // MARK: - Intialization
  init(dispatcher: Dispatcher) {
    self.networkDispatcher = dispatcher
  }
  
  class func shared() -> RequestManager {
      return RequestManager(dispatcher: NetworkDispatcher(environment: Constants.API.environment))
  }
  
  // MARK: - Public
  func searchVideos(text: String, success: @escaping (([ItemViewModel]) -> Void)) {
    var itemsViewModel: [ItemViewModel] = []
    
    self.search(text) { [unowned self] (items) in
      self.fetchVideo(items: items, success: { (itemsDetail) in
        // Set contentDetail on search items
        for (index, itemDetail) in itemsDetail.enumerated() {
          let item = items[index]
          item.detail = itemDetail.detail
          // Create viewModel
          let viewModel = ItemViewModel(itemModel: item)
          itemsViewModel.append(viewModel)
        }
        success(itemsViewModel)
      })
    }
  }
  
  // MARK: - Search
  func search(_ text: String, success: @escaping (([ItemModel]) -> Void)) {
    networkDispatcher.fetch(request: SearchRequests.search(text: text), success: { (response) in
      if let items = ItemModel.deserialize(with: response) {
        success(items)
      }
    }) { (error) in
      
    }
  }
  
  // MARK: - Videos
  func fetchVideo(items: [ItemModel], success: @escaping (([ItemModel]) -> Void)) {
    networkDispatcher.fetch(request: VideosRequests.videos(items: items), success: { (response) in
      if let items = ItemModel.deserialize(with: response) {
        success(items)
      }
    }) { (error) in
      
    }
  }
}



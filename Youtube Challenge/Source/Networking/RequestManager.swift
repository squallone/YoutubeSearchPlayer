//
//  RequestManager.swift
//  YTSearch
//
//  Created by Abdiel Soto on 12/14/17.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

class RequestManager {

  // MARK: - Properties
  private let environment = Environment(httpProtocol: "https://", host: "www.googleapis.com", port: "")
  static let shared = RequestManager()

  // MARK: - Intialization
  private init() { }
  
  // MARK: - Public
  func searchVideos(text: String, success: @escaping (([ItemViewModel]) -> Void)) {
    var itemsViewModel: [ItemViewModel] = []
    
    RequestManager.shared.search(text) { (items) in
      RequestManager.shared.fetchVideo(items: items, success: { (itemsDetail) in
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
  
  // MARK: - Private
  // MARK: Search
  private func search(_ text: String, success: @escaping (([ItemModel]) -> Void)) {
    NetworkDispatcher(environment: environment).fetch(request: SearchRequests.search(text: text), success: { (response) in
      if let items = ItemModel.deserialize(with: response) {
        success(items)
      }
    }) { (error) in
      
    }
  }
  
  // MARK: - Videos
  private func fetchVideo(items: [ItemModel], success: @escaping (([ItemModel]) -> Void)) {
    NetworkDispatcher(environment: environment).fetch(request: VideosRequests.videos(items: items), success: { (response) in
      if let items = ItemModel.deserialize(with: response) {
        success(items)
      }
    }) { (error) in
      
    }
  }
}

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
  
  // MARK: - Private
  
  private init() { }
  
  func search(_ text: String, success: @escaping (([ItemModel]) -> Void)) {
    NetworkDispatcher(environment: environment).fetch(request: SearchRequests.search(text: text), success: { (response) in
      if let items = ItemModel.deserialize(with: response) {
        success(items)
      }
      
    }) { (error) in
      
    }
  }
}

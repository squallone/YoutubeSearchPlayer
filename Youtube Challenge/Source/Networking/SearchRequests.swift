//
//  SearchRequests.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/5/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

enum SearchRequests: RequestProtocol {
  
  case search
  
  var path: String {
    switch  self {
    case .search:
      return "youtube/v3/search"
    }
  }
  
  var method: HTTPMethod {
    switch  self {
    case .search:
      return .get
    }
  }
  
  var parameters: [String : Any] {
    switch  self {
    case .search:
      return ["key": "", "order": "date", "maxResults": "10", "q":"yuya", "type": "video"]
    }
  }
  
  var headers: [String : Any]? {
    switch  self {
    case .search:
      return [:]
    }
  }
}

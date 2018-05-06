//
//  SearchRequests.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/5/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

enum SearchRequests: RequestProtocol {
  
  case search(text: String)
  
  var path: String {
    switch  self {
    case .search(_):
      return "/youtube/v3/search"
    }
  }
  
  var method: HTTPMethod {
    switch  self {
    case .search(_):
      return .get
    }
  }
  
  var parameters: RequestParams {
    switch  self {
    case .search(let text):
      return .url(["key": Constants.Youtube.appKey,
                   "order": "date",
                   "maxResults": "10",
                   "q": text,
                   "part": "snippet",
                   "type": "video"])
    }
  }
  
  var headers: [String : Any]? {
    switch  self {
    case .search(_):
      return [:]
    }
  }
}

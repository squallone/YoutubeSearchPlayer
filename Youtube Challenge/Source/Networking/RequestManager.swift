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
  private let environment: Environment!
  static let shared = RequestManager()
  
  // MARK: - Private
  
  private init() {
    environment = Environment(httpProtocol: "http://", host: "www.googleapis.com", port: "")

  }
}

//
//  NetworkDispatcher.swift
//  YTSearch
//
//  Created by Abdiel Soto on 12/14/17.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import Foundation

class NetworkDispatcher: Dispatcher {
  
  // MARK: - Configuration
  private var environment: Environment
  
  // Here you can use URLSession, Alamofire, AFNetworking
  private var session: URLSession
  
  // MARK: - Init
  required init(environment: Environment) {
    self.environment = environment
    self.session = URLSession(configuration: .default)
  }
  
  // MARK: - Public
  func fetch(request: RequestProtocol, success: @escaping (Response) -> Void, failure: @escaping (NSError) -> Void) {
    // Get URL
    guard let apiURL = prepareURL(for: request) else {
      failure(NSError(domain: Constants.reverseDomain, code: 100, userInfo: [NSLocalizedDescriptionKey: "error"]))
      return
    }
    
    // Get data
    let dataTask = session.dataTask(with: apiURL) { (data, urlResponse, error) in
      
      // Validate data
      guard let responseData = data else {
        failure(NSError())
        return
      }
      let response = Response(data: responseData, request: request)
      DispatchQueue.main.async {
        success(response)
      }
    }
    dataTask.resume()
  }
  
  
  func prepareURL(for request: RequestProtocol) -> URLRequest? {
    
    // Compose the url
    var urlRequest = URLRequest(url: URL(string: environment.urlString)!)
    
    switch request.parameters {
    case .url(let params):
      // Parameters are part of the url
      if let params = params as? [String: String] {
        let queryParams = params.map({ (element) -> URLQueryItem in
          return URLQueryItem(name: element.key, value: element.value)
        })
        guard var components = URLComponents(string: environment.urlString) else {
          return nil
        }
        components.queryItems = queryParams
        urlRequest.url = components.url
      }

    default:
      break
    }    
    return nil
  }

}

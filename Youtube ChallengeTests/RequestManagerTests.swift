//
//  RequestManagerTests.swift
//  Youtube ChallengeTests
//
//  Created by Abdiel Soto on 5/7/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import XCTest

class RequestManagerTests: XCTestCase {
  
  // Set environment
  var searchManager: RequestManager!
  var videosManager: RequestManager!

  override func setUp() {
    super.setUp()
    let mockSearchDispatcher = MockSearchDispatcher(environment: Constants.API.environment)
    searchManager = RequestManager(dispatcher: mockSearchDispatcher)
    
    let mockVideosDispatcher = MockVideosDispatcher(environment: Constants.API.environment)
    videosManager = RequestManager(dispatcher: mockVideosDispatcher)
  }
  
  override func tearDown() {
    searchManager = nil
    videosManager = nil
    super.tearDown()
  }

  
  // MARK: - NertworkDispatcher
  func testFetchSearch() {
    
    searchManager.search("sample") { (items) in
      XCTAssert(items.count == 10)
    }
  }
  
  func testFetchVideos() {
    
    videosManager.search("sample") { (items) in
      XCTAssert(items.count == 1)
    }
  }

}

fileprivate class MockSearchDispatcher : Dispatcher {

  required init(environment: Environment) { }

  func fetch(request: RequestProtocol, success: @escaping (Response) -> Void, failure: @escaping (NSError) -> Void) {
    // giving a sample json file
    guard let data = FileManager.readJson(forResource: "search") else {
      XCTAssert(false, "Can't get data from sample.json")
      return
    }
    let response = Response(data: data, request: request)
    success(response)
  }
}

fileprivate class MockVideosDispatcher : Dispatcher {
  
  required init(environment: Environment) { }
  
  func fetch(request: RequestProtocol, success: @escaping (Response) -> Void, failure: @escaping (NSError) -> Void) {
    // giving a sample json file
    guard let data = FileManager.readJson(forResource: "videos") else {
      XCTAssert(false, "Can't get data from sample.json")
      return
    }
    let response = Response(data: data, request: request)
    success(response)
  }
}



extension FileManager {
  
  static func readJson(forResource fileName: String ) -> Data? {
    
    let bundle = Bundle(for: RequestManagerTests.self)
    if let path = bundle.path(forResource: fileName, ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return data
      } catch {
        // handle error
      }
    }
    
    return nil
  }
}



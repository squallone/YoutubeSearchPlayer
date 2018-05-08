//
//  RequestsTest.swift
//  Youtube ChallengeTests
//
//  Created by Abdiel Soto on 5/8/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import XCTest

class RequestsTest: XCTestCase {
  
  var searchRequests: SearchRequests!
  var videoRequests: VideosRequests!
    
  override func setUp() {
    searchRequests = SearchRequests.search(text: "youtube")
    videoRequests = VideosRequests.videos(items: [ItemModel()])
    super.setUp()
  }
  
  override func tearDown() {
      super.tearDown()
  }
  
  func testPaths() {
    XCTAssertEqual(searchRequests.path, "/youtube/v3/search")
    XCTAssertEqual(videoRequests.path, "/youtube/v3/videos")
  }  
}

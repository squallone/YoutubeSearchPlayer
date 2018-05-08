//
//  EnvironmentTests.swift
//  Youtube ChallengeTests
//
//  Created by Abdiel Soto on 5/8/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import XCTest

class EnvironmentTests: XCTestCase {
  
  var environment: Environment!

  override func setUp() {
    super.setUp()
    environment = Environment(httpProtocol: "https://", host: "www.googleapis.com", port: "")
  }
  
  override func tearDown() {
    environment = nil
    super.tearDown()
  }
  
// MARK: - Environment
  func testEnvironment() {
    XCTAssertEqual(environment.urlString, "https://www.googleapis.com")
  }
    
}

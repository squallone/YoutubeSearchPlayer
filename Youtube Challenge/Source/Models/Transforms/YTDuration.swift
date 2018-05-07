//
//  YTDuration.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/7/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import Foundation
import ObjectMapper

class YTDuration: TransformType {
  
  typealias Object = String
  typealias JSON = String
  
  func transformFromJSON(_ value: Any?) -> String? {
    guard let string = value as? String else { return nil }
    
    return string.yotubeDuration()
 
  }
  
  func transformToJSON(_ value: String?) -> String? {
    guard let data = value else{
      return nil
    }
    return "\(data)"
  }
}

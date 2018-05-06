//
//  ContentDetaiModel.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import ObjectMapper

class ContentDetaiModel {

  var duration: String?
  
  required convenience init?(map: Map) {
    self.init()
  }
}

extension ContentDetaiModel: Mappable {
 
  func mapping(map: Map) {
    duration <- map["duration"]
  }
}

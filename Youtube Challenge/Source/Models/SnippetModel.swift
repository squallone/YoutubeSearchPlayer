//
//  SnippetModel.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import ObjectMapper

class SnippetModel {
  
  var channelId: String?
  var title: String?
  var description: String?
  var thumbailUrl: URL?
  
  required convenience init?(map: Map) {
    self.init()
  }
}

extension SnippetModel:  Mappable {
  
  // MARK: - Mapping
  func mapping(map: Map) {
    channelId   <- map["channelId"]
    title       <- map["title"]
    description <- map["description"]
    thumbailUrl <- (map["thumbnails.high.url"], URLTransform())
  }
}

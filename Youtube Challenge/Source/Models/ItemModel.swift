//
//  ItemModel.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/5/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import ObjectMapper

class ItemModel {

  var channelId: String?
  var title: String?
  var description: String?
  var thumbailUrl: URL?
  
  required convenience init?(map: Map) {
    self.init()
  }
}

extension ItemModel: Mappable {
  
  func mapping(map: Map) {
    channelId   <- map["snippet.channelId"]
    title       <- map["snippet.title"]
    description <- map["snippet.description"]
    thumbailUrl <- map["snippet.thumbnails.high.url"]
  }
  
  // MARK: - Deserialize
  class func deserialize(with response: Response) -> [ItemModel]? {
    
    // Get JSON
    guard let jsonData = response.jsonData(),
      let jsonItems = jsonData["items"] as? [[String: Any]] else {
        return nil
    }
    // Create JSON
    let itemsModel = Mapper<ItemModel>().mapArray(JSONArray: jsonItems)
    return itemsModel
  }
}

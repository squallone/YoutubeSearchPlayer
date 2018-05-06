//
//  ItemViewModel.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import Foundation

class ItemViewModel {
  
  // MARK: - Properties
  let model: ItemModel!
  
  var title: String {
    return self.model.snippet?.title ?? ""
  }

  var imageUrl: URL? {
    return self.model.snippet?.thumbailUrl
  }
  
  // MARK: - Initialization
  init(itemModel: ItemModel) {
    self.model = itemModel
  }
}

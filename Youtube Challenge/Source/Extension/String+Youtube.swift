//
//  String+Youtube.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/7/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//


extension String {
  
  func yotubeDuration() -> String {
    
    let formattedDuration = self.replacingOccurrences(of: "PT", with: "").replacingOccurrences(of: "H", with:":").replacingOccurrences(of: "M", with: ":").replacingOccurrences(of: "S", with: "")
    
    let components = formattedDuration.components(separatedBy: ":")
    var duration = ""
    for component in components {
      duration = duration.count > 0 ? duration + ":" : duration
      if component.count < 2 {
        duration += "0" + component
        continue
      }
      duration += component
    }
    
    if duration.count == 2 {
      duration = "0:" + duration
    }
    
    return duration
  }
}

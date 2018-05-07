//
//  UIImageView+Networking.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
  func loadImage(url: URL?, placeholder: UIImage? = nil) {
    // Set placeholder image
    self.image = placeholder

    guard let imageUrl = url else { return }
    if let cachedImage = imageCache.object(forKey: imageUrl.absoluteString as NSString) as? UIImage {
      self.image = cachedImage
      return
    }
    
    // Set download image from url
    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
      guard error == nil else { return }
      DispatchQueue.main.async {
        if let image = UIImage(data: data!) {
          imageCache.setObject(image, forKey: imageUrl.absoluteString as NSString)
          
          UIView.transition(with: self,
                            duration:0.2,
                            options: .transitionCrossDissolve,
                            animations: {  self.image = image},
                            completion: nil)          
        }
      }
    }).resume()
  }
}

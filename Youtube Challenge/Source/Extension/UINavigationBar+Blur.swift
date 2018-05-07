//
//  UINavigationBar+Blur.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

extension UINavigationBar {
  func installBlurEffect() {
    isTranslucent = true
    setBackgroundImage(UIImage(), for: .default)
    let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    var blurFrame = bounds
    blurFrame.size.height += statusBarHeight
    blurFrame.origin.y -= statusBarHeight
    let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    blurView.isUserInteractionEnabled = false
    blurView.frame = blurFrame
    blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(blurView)
    blurView.layer.zPosition = -1
  }
}

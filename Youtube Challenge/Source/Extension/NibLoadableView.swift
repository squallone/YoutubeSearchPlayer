//
//  NibLoadableView.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//
import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
  
  static func fromNib<T: UIView>() -> T {
    return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)![0] as! T
  }
}


//
//  ReusableView.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

protocol ReusableView: class{
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView{
    static var reuseIdentifier: String{
        return NSStringFromClass(self)
    }
}

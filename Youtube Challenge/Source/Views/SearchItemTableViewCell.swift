//
//  SearchItemTableViewCell.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

class SearchItemTableViewCell: UITableViewCell {

  @IBOutlet weak var videoImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    videoImageView.contentMode = .scaleToFill
  }
  
  func setup(viewModel: ItemViewModel) {
    titleLabel.text = viewModel.title
    videoImageView?.loadImage(url: viewModel.imageUrl, placeholder: UIImage(named: "placeholder"))
  }
}

extension SearchItemTableViewCell: ReusableView, NibLoadableView { }

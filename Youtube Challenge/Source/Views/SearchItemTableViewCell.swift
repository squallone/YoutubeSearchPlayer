//
//  SearchItemTableViewCell.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit

class SearchItemTableViewCell: UITableViewCell {

  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var overlayView: UIView!
  @IBOutlet weak var videoImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var addedLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none;
    contentView.backgroundColor = .clear
    backgroundColor = .clear
    
    durationLabel.textColor = .white
    addedLabel.textColor = .white

    overlayView.backgroundColor = UIColor(white: 0.1, alpha: 0.35)
    overlayView.layer.cornerRadius = 5.0

    videoImageView.backgroundColor = UIColor.searchBackgroundColor
    videoImageView.contentMode = .scaleToFill
    videoImageView.layer.cornerRadius = 5.0
    videoImageView.clipsToBounds = true
    
    cardView.dropShadow(color: .black, opacity: 0.76, offSet: CGSize(width: -1, height: 1), radius: 5, scale: true)
    cardView.layer.cornerRadius = 5.0

  }
  
  func setup(viewModel: ItemViewModel) {
    titleLabel.text = viewModel.title
    durationLabel.text = viewModel.duration
    addedLabel.text = viewModel.published
    videoImageView?.loadImage(url: viewModel.imageUrl, placeholder: nil)
  }
}

extension SearchItemTableViewCell: ReusableView, NibLoadableView { }

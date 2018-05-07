//
//  YoutubePlayerViewController.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/6/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class YoutubePlayerViewController: UIViewController {

  // MARK: - Properties
  let itemViewModel: ItemViewModel!
  
  lazy var playerView: YTPlayerView = {
    let playerView = YTPlayerView()
    playerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(playerView)
    return playerView
  }()
  
  
  // MARK: - Initializers
  init(itemViewModel: ItemViewModel) {
    self.itemViewModel = itemViewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    playerView.load(withVideoId: itemViewModel.videoId)
    playerView.delegate = self
  }
  
  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    // Set constraints
    let views = ["playerView": playerView]
    var constraints: [NSLayoutConstraint] = []
     constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[playerView]|", metrics: [:], views: views))
    constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[playerView]|", metrics: [:], views: views))
    NSLayoutConstraint.activate(constraints)
  }
}

extension YoutubePlayerViewController: YTPlayerViewDelegate {
  
  func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
    playerView.playVideo()
  }
  
}

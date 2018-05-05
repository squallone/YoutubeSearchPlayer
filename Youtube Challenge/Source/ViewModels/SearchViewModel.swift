//
//  SearchViewModel.swift
//  Youtube Challenge
//
//  Created by Abdiel Soto on 5/5/18.
//  Copyright © 2018 Applicaster. All rights reserved.
//

class SearchViewModel {
  
  // MARK: View Model State
  enum State {
    case fetching
    case success
    case error
    case idle
  }
  
  // MARK: - Properties
  typealias Listener = (_ status: State) -> Void
  var listener: Listener?
  var state: State = .idle {
    didSet {
      listener?(state)
    }
  }
  
  // MARK: - Pubic
  func bindState(_ listener: @escaping Listener) {
    self.listener = listener
  }
  
  func unbindState() {
    self.listener = nil
  }
  
  // MARK: - Private


}

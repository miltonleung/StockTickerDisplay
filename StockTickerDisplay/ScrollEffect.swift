//
//  ScrollEffect.swift
//  StockTickerDisplay
//
//  Created by Milton Leung on 2020-05-26.
//  Copyright © 2020 milton. All rights reserved.
//

import SwiftUI

struct ScrollEffect: GeometryEffect {
  var animatableData: CGFloat {
    get { translationX }
    set { translationX = newValue }
  }

  @Binding var resetViews: Bool
  var offset: CGFloat
  var translationX: CGFloat

  func effectValue(size: CGSize) -> ProjectionTransform {
    
    DispatchQueue.main.async {
      self.resetViews = self.translationX == self.offset
    }

    let translation = CGAffineTransform(translationX: translationX, y: 0)
    return ProjectionTransform(translation)
  }
}


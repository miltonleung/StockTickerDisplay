//
//  ContentView.swift
//  StockTickerDisplay
//
//  Created by Milton Leung on 2020-05-25.
//  Copyright © 2020 milton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var cellsToShow = 7
  @State var stocks: [Stock] = []
  var cellWidth: CGFloat = 150.0 // Update to actual width
  @State var startingIndex: Int = 0

  @State private var resetViews = false

  @State private var startAnimateAutoScroll = true
  @State private var animateAutoScroll = false

  @State private var horizontalDragAmount: CGFloat = 0

  var body: some View {
    let binding = Binding<Bool>(get: { self.resetViews }, set: { self.updateBinding($0) })

    return HStack {
      if (!stocks.isEmpty) {
        ForEach(0..<cellsToShow) {
          ItemView(stock: self.stocks[($0 + self.startingIndex) % self.stocks.count])
            .frame(width: self.cellWidth)
        }
      }
    }
    .padding(5)
    .offset(x: horizontalDragAmount, y: 0)
    .modifier(ScrollEffect(resetViews: binding, offset: -cellWidth, translationX: animateAutoScroll ? -cellWidth : 0))
    .onAppear() {
      withAnimation(self.startAnimateAutoScroll ? Animation.linear(duration: 2).repeatForever(autoreverses: false) : .default) {
        self.animateAutoScroll = true;
      }
    }
//    .gesture(
//      DragGesture()
//        .onChanged {
//          self.startAnimateAutoScroll = false
//          self.horizontalDragAmount = $0.translation.width }
//    )
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
  }

  func updateBinding(_ value: Bool) {
    if resetViews != value && !resetViews {
      startingIndex += 1
    }
    resetViews = value
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(stocks: testStockData)
  }
}

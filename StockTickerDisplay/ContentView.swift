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

  @State private var cellSizes: [CGSize] = []
  @State private var cellSize: CGSize = CGSize.zero

  //  @State private var resetViews = false

  //  @State private var startAnimateAutoScroll = true
  //  @State private var animateAutoScroll = false

  @State private var horizontalDragAmount: CGFloat = 10
  @State private var offset: CGFloat = 0

  var body: some View {
    //    let binding = Binding<Bool>(get: { self.resetViews }, set: { self.updateBinding($0) })

    func makeHorizontalStack() -> some View {
      HStack {
        ForEach(0..<self.cellsToShow) { index in
          ItemView(stock: self.stocks[(index + self.startingIndex) % self.stocks.count], index: (index + self.startingIndex) % self.stocks.count)
            .frame(width: 150, height: 150)
        }

      }
    }

    return
      Group {
        GeometryReader { geoProxy in
          if (!self.stocks.isEmpty) {
            makeHorizontalStack()
              .padding(5)

              //                .modifier(ScrollEffect(resetViews: binding, offset: -self.cellWidth, translationX: self.animateAutoScroll ? -self.cellWidth : 0))
              .preference(key: HorizontalOffsetPreferenceKey.self, value: geoProxy.frame(in: .global).minX)

              .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
              .gesture(
                DragGesture(coordinateSpace: .global)
                  .onChanged {
                    //                    print($0.translation)
                    //                    self.isAutoScrollAnimating = false
                    self.horizontalDragAmount = $0.translation.width
                    //                  if (self.horizontalDragAmount == -150) {
                    //                    self.horizontalDragAmount = 0
                    //                    //          self.startingIndex += 1
                    //                  }
                    self.offset = self.horizontalDragAmount.truncatingRemainder(dividingBy: 150)
                }
                .onEnded {_ in
                  self.horizontalDragAmount = 0;
                }
            )
              .onPreferenceChange(HorizontalOffsetPreferenceKey.self) { preferences in
                print("offset: \(preferences)")
                //                guard let offset = preferences else { return }
                if (self.horizontalDragAmount == -150) {
                  self.horizontalDragAmount = 0
                  //          self.startingIndex += 1
                }

            }
            //            .onPreferenceChange(ItemSizePreferenceKey.self) { (preferences: [ItemSizePreferenceData]) in
            //              if (self.cellSizes.count != self.stocks.count) {
            //                self.cellSizes = Array<CGSize>(repeating: CGSize.zero, count: self.stocks.count)
            //              }
            //              for itemData in preferences {
            //                self.cellSizes[itemData.index] = itemData.size
            //              }
            //              self.cellSize = self.cellSizes[0]
            //              print(self.cellSizes)
            //            }
          }
        }
      }
      .offset(x: self.offset, y: 0)
  }

  //  func updateBinding(_ value: Bool) {
  //    if resetViews != value && !resetViews {
  //      startingIndex += 1
  //    }
  //    resetViews = value
  //  }
}

struct HorizontalOffsetPreferenceKey: PreferenceKey {
  typealias Value = CGFloat

  static var defaultValue: Value = 0

  static func reduce(value: inout Value, nextValue: () -> Value) {
    value = nextValue()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(stocks: testStockData)
  }
}

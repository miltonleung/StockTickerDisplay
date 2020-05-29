//
//  ItemView.swift
//  StockTickerDisplay
//
//  Created by Milton Leung on 2020-05-25.
//  Copyright © 2020 milton. All rights reserved.
//

import SwiftUI

struct ItemView: View {
  var stock: Stock
  var index: Int

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(stock.symbol.uppercased())
        Text("$\(stock.lastPrice)")
      }.border(Color.black)
      Spacer().border(Color.black)
    }
    .background(
      GeometryReader { geometry in
        return Color.clear.preference(key: ItemSizePreferenceKey.self, value: [ItemSizePreferenceData(index: self.index, size: geometry.size)])
    })
  }
}

struct ItemSizePreferenceData: Equatable {
  let index: Int
  let size: CGSize
}

struct ItemSizePreferenceKey: PreferenceKey {
  typealias Value = [ItemSizePreferenceData]

  static var defaultValue: Value = []

  static func reduce(value: inout Value, nextValue: () -> Value) {
    value.append(contentsOf: nextValue())
  }
}


struct ItemView_Previews: PreviewProvider {
  static var previews: some View {
    ItemView(stock: testStockData[0], index: 0)
  }
}

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
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(stock.symbol.uppercased())
        Text("$\(stock.lastPrice)")
      }
      Spacer().border(Color.black)
    }
  }
}

struct ItemView_Previews: PreviewProvider {
  static var previews: some View {
    ItemView(stock: testStockData[0])
  }
}

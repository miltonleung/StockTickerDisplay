//
//  Stock.swift
//  StockTickerDisplay
//
//  Created by Milton Leung on 2020-05-25.
//  Copyright © 2020 milton. All rights reserved.
//

import Foundation

struct Stock {
  var name: String
  var symbol: String
  var lastPrice: Double
}

#if DEBUG
let testStockData = [
  Stock(name: "Apple Inc.", symbol: "AAPL", lastPrice: 330.14),
  Stock(name: "S&P 500", symbol: "SPY", lastPrice: 294.49),
  Stock(name: "Alphabet", symbol: "GOOG", lastPrice: 1409.23),
  Stock(name: "Tesla Motors", symbol: "TSLA", lastPrice: 836.24),
  Stock(name: "1Apple Inc.", symbol: "AAPL", lastPrice: 330.14),
  Stock(name: "1S&P 500", symbol: "SPY", lastPrice: 294.49),
  Stock(name: "1Alphabet", symbol: "GOOG", lastPrice: 1409.23),
  Stock(name: "1Tesla Motors", symbol: "TSLA", lastPrice: 836.24),
  Stock(name: "2Apple Inc.", symbol: "AAPL", lastPrice: 330.14),
  Stock(name: "2S&P 500", symbol: "SPY", lastPrice: 294.49),
  Stock(name: "2Alphabet", symbol: "GOOG", lastPrice: 1409.23),
  Stock(name: "2Tesla Motors", symbol: "TSLA", lastPrice: 836.24)
]
#endif

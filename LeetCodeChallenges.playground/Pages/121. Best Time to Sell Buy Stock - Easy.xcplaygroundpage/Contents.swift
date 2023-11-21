//: [Previous](@previous)

import Foundation

// 121. Best time to buy a stock

/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 */

// MARK: - My Solution
//Big O(n)
func maxProfit(_ prices: [Int]) -> Int {
    var value : Int?
    var profit = 0
    for currentPrice in prices {
        if let val = value {
            let currentProfit = currentPrice - val
            profit = max(profit, currentProfit)
            if currentProfit < 0 {
                value = currentPrice
            }
        } else {
            value = currentPrice
        }
    }
    return profit
}

// MARK: - Tests
import XCTest

class StockProfitTests : XCTestCase {
    
    func testProfitOfFive(){
        let input = [7,1,5,3,6,4]
        let output = 5
        XCTAssertEqual(maxProfit(input), output)
    }
    
    func testProfitOfZero(){
        let input = [7,6,4,3,1]
        let output = 0
        XCTAssertEqual(maxProfit(input), output)
    }
}

StockProfitTests.defaultTestSuite.run()

//: [Next](@next)

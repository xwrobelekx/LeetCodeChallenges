//: [Previous](@previous)

import Foundation

// 121. Best Time to Buy and Sell Stock

// MARK: -  My Solution

// This works on small inputs but exceeds time expectation on large inputs.
// Time complexity: O(n)
func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    
    for (index, n) in prices.enumerated() {
        for i in (index + 1)..<prices.count {
            profit =  max(profit, prices[i] - n)
        }
    }
    
    return profit
}

// Neat and easy solution
func maxProfit4(_ prices: [Int]) -> Int {
    var maxProfit = 0
    var lowestPrice = Int.max

    for price in prices {
        lowestPrice = min(lowestPrice, price)
        maxProfit = max(maxProfit, price - lowestPrice)
    }

    return maxProfit
}

// 761 ms beats 25%, 18 MB beats 18%
func maxProfit2(_ prices: [Int]) -> Int {
    var profit = 0
    var lowestPrice = prices[0]
    
    for price in prices {
        if price < lowestPrice {
            lowestPrice = price
        }
        profit = max(profit, price - lowestPrice)
    }
    
    return profit
}

// MARK: - Other Solutions
func maxProfit3(_ prices: [Int]) -> Int {
    guard prices.count > 1 else { return 0 }
    var best = 0, current = 0
    for index in 1..<prices.endIndex {
        current = max(0, current + prices[index] - prices[index-1])
        best = max(best, current)
    }
    return best
}

// MARK: - Tests
import XCTest

class MaxProfitTests: XCTestCase {
    func testExample() {
        let prices = [7,1,5,3,6,4]
        XCTAssertEqual(maxProfit(prices), 5)
        XCTAssertEqual(maxProfit2(prices), 5)
        XCTAssertEqual(maxProfit3(prices), 5)
    }
    
    func testExample2() {
        let prices = [7,6,4,3,1]
        XCTAssertEqual(maxProfit(prices), 0)
        XCTAssertEqual(maxProfit2(prices), 0)
        XCTAssertEqual(maxProfit3(prices), 0)
    }
}

MaxProfitTests.defaultTestSuite.run()
//: [Next](@next)

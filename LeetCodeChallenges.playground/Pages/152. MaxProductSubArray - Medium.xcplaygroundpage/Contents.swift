//: [Previous](@previous)

import Foundation

// 152 Max Product Sub Array

/*
 Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

 The test cases are generated so that the answer will fit in a 32-bit integer.

 A subarray is a contiguous subsequence of the array.
 */

// MARK: - My Solution:
func maxProduct(_ nums: [Int]) -> Int {
    var result = nums[0]
    
    for (i, _) in nums.enumerated() {
        var cur = 1
        for j in i..<nums.count {
            cur *= nums[j]
            result = max(result, cur)
        }
    }
    
    return result
}

// MARK: - Tests
import XCTest

class MaxProductTests: XCTestCase {
    func testExample1() {
        let input = [-2,3,-4]
        let output = 24
        XCTAssertEqual(maxProduct(input), output, "❌ Failed On example test 1")
    }

    func testExample2() {
        let input = [2,3,-2,4]
        let output = 6
        XCTAssertEqual(maxProduct(input), output, "❌ Failed On example test 2")
    }

    func testExample3() {
        let input = [-2,0,-1]
        let output = 0
        XCTAssertEqual(maxProduct(input), output, "❌ Failed On example test 3")
    }

    func testExample4() {
        let input = [2,3,-2,4]
        let output = 6
        XCTAssertEqual(maxProduct(input), output, "❌ Failed On example test 4")
    }
}

MaxProductTests.defaultTestSuite.run()
//: [Next](@next)

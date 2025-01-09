//: [Previous](@previous)

import Foundation

// 561. Array Partition - Easy
// Link: https://leetcode.com/problems/array-partition/description/

// MARK: My Solution
// 9ms bets 52%, memory: 18mb, beats 44%
func arrayPairSum(_ nums: [Int]) -> Int {
    let sorted = nums.sorted()
    var sum = 0
    var index = 0
    while index < nums.count - 1 {
        sum += min(sorted[index], sorted[index+1])
        index += 2
    }
    return sum
}

// MARK: - Other Solutions
func arrayPairSum2(_ nums: [Int]) -> Int {
    let sortedArray = nums.sorted()
    var max = 0
    
    for index in stride(from: 0, to: nums.count, by: 2) {
        max += sortedArray[index]
    }
    return max
}


// MARK: - Tests
import XCTest

class PairSumTest: XCTestCase {
    func testExample() {
        let input: [Int] = [1, 3, 2, 4]
        XCTAssertEqual(arrayPairSum(input), 4)
    }
    
    func testExample2() {
        let input: [Int] = [6,2,6,5,1,2]
        XCTAssertEqual(arrayPairSum(input), 9)
    }
}


PairSumTest.defaultTestSuite.run()

//: [Next](@next)

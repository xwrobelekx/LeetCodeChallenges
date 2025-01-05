//: [Previous](@previous)

import Foundation

// 485. Max Consecutive Ones
// https://leetcode.com/problems/max-consecutive-ones/description/

// MARK: -  My solution
// run 3ms beats 16%, memory: 17mb beats 100%
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var highestCount = 0
    var currentCount = 0
    for num in nums {
        if num == 1 {
            currentCount += 1
        } else {
            highestCount = max(highestCount, currentCount)
            currentCount = 0
        }
    }
    highestCount = max(highestCount, currentCount)
    return highestCount
}

// MARK: - Other Solutions:


// MARK: Tests
import XCTest

class TestFindingMaxConsecutiveOnes: XCTestCase {
    func testExampleOne() {
        let input = [1,1,0,1,1,1]
        XCTAssertEqual(findMaxConsecutiveOnes(input), 3)
    }
    
    func testExampleTwo() {
        let input = [1,0,1,1,0,1]
        XCTAssertEqual(findMaxConsecutiveOnes(input), 2)
    }
    
    func testEmptyArray() {
        let input : [Int] = []
        XCTAssertEqual(findMaxConsecutiveOnes(input), 0)
    }
}

TestFindingMaxConsecutiveOnes.defaultTestSuite.run()

//: [Next](@next)

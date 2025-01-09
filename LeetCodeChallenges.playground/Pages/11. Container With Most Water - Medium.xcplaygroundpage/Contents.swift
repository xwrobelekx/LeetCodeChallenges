//: [Previous](@previous)

import Foundation

// 11. Container With Most Water - Medium
// Link: https://leetcode.com/problems/container-with-most-water/

// MARK: My Solution
func maxArea(_ height: [Int]) -> Int {
    var frontIndex = 0
    var backIndex = height.count - 1
    var biggestArea = 0

    while frontIndex < backIndex {
        let heightOne = height[frontIndex]
        let heightTwo = height[backIndex]
        let lowerHeight = min(heightOne, heightTwo)
        let distance = backIndex - frontIndex
        let area = lowerHeight * distance
        biggestArea = max(biggestArea, area)
        if heightOne < heightTwo {
            frontIndex += 1
        } else {
            backIndex -= 1
        }
    }
    return biggestArea
}
// MARK: - Other Solutions


// MARK: - Tests
import XCTest

class MaxAreaTest: XCTestCase {
    func testExample() {
        let input = [1,8,6,2,5,4,8,3,7]
        XCTAssertEqual(maxArea(input), 49)
    }
    
    func testExample2() {
        let input = [1, 1]
        XCTAssertEqual(maxArea(input), 1)
    }
    
    func testExample3() {
        let input = [8,7,2,1]
        XCTAssertEqual(maxArea(input), 7)
    }
}


MaxAreaTest.defaultTestSuite.run()


//: [Next](@next)

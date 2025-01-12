//: [Previous](@previous)

import Foundation

// 414. Third Maximum Number - Easy
// Link: https://leetcode.com/problems/third-maximum-number/description/

// MARK: My Solution
// 5ms beats 12%  Memory 17mb beats 29%
func thirdMax(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    let reverseSorted = nums.sorted(by: >)
    var previous = Int.max
    var count = 0
    
    for num in reverseSorted {
        if num != previous {
            count += 1
        }
        if count == 3 {
            return num
        }
        previous = num
    }
    return reverseSorted[0]
}

// MARK: - Other Solutions
// Use set, this way you have unique numbers
func thirdMax2(_ nums: [Int]) -> Int {
    var maxs = Set(nums).sorted()
    if maxs.count < 3 {
        return maxs.last!
    } else {
        return maxs[maxs.count - 3]
    }
}

func thirdMax3(_ nums: [Int]) -> Int {
    var set = Set(nums)
    var arr = Array(set.sorted(by: >))
    return arr.count > 2 ? arr[2] : arr[0]
}

// MARK: - Tests
import XCTest

class ThirdMaxTests: XCTestCase {
    func testExample() {
        let input = [1, 2, 3, 4, 5]
        XCTAssertEqual(thirdMax(input), 3)
    }
    
    func testCaseTwo() {
        let input = [1,2]
        XCTAssertEqual(thirdMax(input), 2)
    }
    
    func testCaseThree() {
        let input = [3,2,1]
        XCTAssertEqual(thirdMax(input), 1)
    }
    
    func testCaseFour() {
        let input = [2,2,3,1]
        XCTAssertEqual(thirdMax(input), 1)
    }
    
    func testCaseFive() {
        let input = [1,1,2]
        XCTAssertEqual(thirdMax(input), 2)
    }
    
    func testNegativeNumbers() {
        let input = [-3,-2,-1,0]
        XCTAssertEqual(thirdMax(input), -2)
    }
}

ThirdMaxTests.defaultTestSuite.run()
//: [Next](@next)

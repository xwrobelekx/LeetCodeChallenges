//: [Previous](@previous)

import Foundation

// 448. Find All Numbers Disappeared in an Array - Easy
// Link:

// MARK: My Solution
// run 31ms beats 18%, memory: 24mb beats 41%
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    Array(Set(1...nums.count).subtracting(Set(nums)).sorted())
}

// MARK: - Other Solutions
// The fastest: 0ms
func findDisappearedNumbers2(_ nums: [Int]) -> [Int] {
    var nums = nums
    for i in 0..<nums.count {
        let j = abs(nums[i]) - 1
        if nums[j] > 0 {
            nums[j] = nums[j] * -1
        }
    }

    var r = [Int]()
    for i in 0..<nums.count {
        if nums[i] > 0 {
            r.append(i+1)
        }
    }

    return r
}

func findDisappearedNumbers3(_ nums: [Int]) -> [Int] {
    var nums = nums
    nums.forEach {n in nums[n-1] = -abs(nums[n-1]) }
    return (1...nums.count).filter{nums[$0-1] > 0}
}

// MARK: - Tests
import XCTest

class DisappearedNumbersTest: XCTestCase {
    func testExample() {
        let input = [1,1]
        XCTAssertEqual(findDisappearedNumbers(input), [2])
    }
    
    func testExampleTwo() {
        let input = [4,3,2,7,8,2,3,1]
        XCTAssertEqual(findDisappearedNumbers(input), [5,6])
    }
}


DisappearedNumbersTest.defaultTestSuite.run()
//: [Next](@next)

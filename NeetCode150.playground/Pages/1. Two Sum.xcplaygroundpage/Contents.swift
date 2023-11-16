//: [Previous](@previous)

import Foundation

// 1. TwoSum

//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//You may assume that each input would have exactly one solution, and you may not use the same element twice.

// MARK: - My Solutions:
// 95 ms beats 14.5%, memory 14.4 MB beats 38%
// Time complexity: Exponential O(n^2) because of the nested loop, Space complexity: Linear O(1)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (indexI, i) in nums.enumerated() {
        for (indexJ, j) in nums.enumerated() {
            if indexI != indexJ {
                if i + j == target {
                    return [indexI, indexJ]
                }
            }
        }
    }
    return [0]
}

// MARK: Other Solutions
// Dictionary approach
// Time complexity: O(n), Space complexity O(n)
// 37 ms, beats 97.1 %, 14.6 MB beats 6.6%
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
        
    for (index, n) in nums.enumerated() {
        let diff = target - n
        
        if let index2 = dict[diff] {
            return [index2, index]
        } else {
            dict[n] = index
        }
    }
    return[0]
}


// Two pointer solution
// Time complexity O(n^2), Space Complexity: O(n) due to creation of sorted array.
func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    let sortedNums = nums.sorted()
    var left = 0
    var right = nums.count - 1

    while left < right {
        let sum = sortedNums[left] + sortedNums[right]
        if sum == target {
            if let index1 = nums.firstIndex(of: sortedNums[left]),
               let index2 = nums.lastIndex(of: sortedNums[right]) {
            return [index1, index2]
            }
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }

    return []
}

// MARK: - Tests
import XCTest

class TwoSumTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(twoSum([2,7,11,15], 9), [0, 1])
        XCTAssertEqual(twoSum2([2,7,11,15], 9), [0, 1])
        XCTAssertEqual(twoSum3([2,7,11,15], 9), [0, 1])
    }
    
    func testExample2() {
        XCTAssertEqual(twoSum([3, 2, 4], 6), [1, 2])
        XCTAssertEqual(twoSum2([3, 2, 4], 6), [1, 2])
        XCTAssertEqual(twoSum3([3, 2, 4], 6), [1, 2])
    }
    
    func testExample3() {
        XCTAssertEqual(twoSum([3, 3], 6), [0, 1])
        XCTAssertEqual(twoSum2([3, 3], 6), [0, 1])
        XCTAssertEqual(twoSum3([3, 3], 6), [0, 1])
    }
}

TwoSumTests.defaultTestSuite.run()


//: [Next](@next)

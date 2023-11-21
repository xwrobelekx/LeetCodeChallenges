//: [Previous](@previous)

import Foundation

// 704. Binary Search - Easy

// MARK: - My Solution
// 238 ms, beats 85%, 14 MB beats 93%
// Time complexity O(log n) because with each iteration Im removing half of the numbers
func search(_ nums: [Int], _ target: Int) -> Int {
    var lowIndex = 0
    var highIndex = nums.count - 1

    while lowIndex <= highIndex {
        let midIndex: Int = lowIndex + ((highIndex - lowIndex) / 2)

        if nums[midIndex] == target {
            return midIndex
        }

        if nums[midIndex] < target {
            lowIndex = midIndex + 1
        } else {
            highIndex = midIndex - 1
        }
    }

    return -1
}

// MARK: - Other Solutions
// O(n)
func search2(_ nums: [Int], _ target: Int) -> Int {
    nums.firstIndex(where: { $0 == target }) ?? -1
}

// MARK: - Tests
import XCTest
class BinarySearchTests: XCTestCase {
    func testExample() {
        let numbers = [-1,0,3,5,9,12]
        let target = 9
        XCTAssertEqual(search(numbers, target), 4)
        XCTAssertEqual(search2(numbers, target), 4)
    }
    
    func testExample2() {
        let numbers = [-1,0,3,5,9,12]
        let target = 2
        XCTAssertEqual(search(numbers, target), -1)
        XCTAssertEqual(search2(numbers, target), -1)
    }
}

BinarySearchTests.defaultTestSuite.run()
//: [Next](@next)

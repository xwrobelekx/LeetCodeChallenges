//: [Previous](@previous)

import Foundation

// 704. Binary Search

/*
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.
 */

// MARK: - My Solution

// This works but its O(n) and it needs to be O(log n)
func search(_ nums: [Int], _ target: Int) -> Int {
    for (i, n) in nums.enumerated() {
        if n == target {
            return i
        }
    }
    return -1
}

// MARK: - Tests
import XCTest

class BinarySearchTests : XCTestCase {
    func testSampleOne() {
        XCTAssertEqual(search([-1,0,3,5,9,12], 9), 4, "Failed On sample test one")
    }
    
    func testNumberDoesNotExists() {
        XCTAssertEqual(search([-1,0,3,5,9,12], 2), -1, "Failed On Number Doesn't Exists")
    }
}

BinarySearchTests.defaultTestSuite.run()

//: [Next](@next)

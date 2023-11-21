//: [Previous](@previous)

import Foundation

// 35. Search Insertion Position

/*
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.
 */

// MARK: - My Solution
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    for (i, num) in nums.enumerated() {
        if num == target {
            return i
        } else if num > target {
            return i
        }
    
    }
    return nums.count
}

// MARK: - Other Solutions:
func searchInsert2(_ nums: [Int], _ target: Int) -> Int {
        if target > nums[nums.count-1] { return nums.count }
        if target < nums[0] { return 0 }
        var i : Int

        var l = 0, r = nums.count-1
        while l <= r {
            i = l + (r - l)/2
            guard nums[i] != target else { return i }
            if nums[i] > target {
                if nums[i-1] < target { return i }
                r = i-1
            } else {
                if nums[i+1] > target { return i+1 }
                l = i+1
            }
        }
        return nums.count
    }

// MARK: - Tests
import XCTest

class SearchInsertPositionTests: XCTestCase {
    func testSample1() {
        XCTAssertEqual(searchInsert([1,3,5,6], 5), 2, "Failed On test sample 1")
        XCTAssertEqual(searchInsert2([1,3,5,6], 5), 2, "Failed On test sample 1-2")
    }
    
    func testSample2() {
        XCTAssertEqual(searchInsert([1,3,5,6], 2), 1, "Failed On test sample 2")
        XCTAssertEqual(searchInsert2([1,3,5,6], 2), 1, "Failed On test sample 2-2")
    }
    
    func testSample3() {
        XCTAssertEqual(searchInsert([1,3,5,6], 7), 4, "Failed On test sample 3")
        XCTAssertEqual(searchInsert2([1,3,5,6], 7), 4, "Failed On test sample 3-2")
    }
}

SearchInsertPositionTests.defaultTestSuite.run()


//: [Next](@next)

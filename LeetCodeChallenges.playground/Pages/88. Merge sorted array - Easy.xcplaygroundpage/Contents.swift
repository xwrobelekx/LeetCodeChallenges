//: [Previous](@previous)

import Foundation

// 88. Merge sorted array - Easy

// Link: https://leetcode.com/problems/merge-sorted-array/?envType=study-plan-v2&envId=top-interview-150

// Objective:
// Merge and sort 2 arrays. The first array contains 0's allocating enough memory for the second array.


// Example:
// Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
// Output: [1,2,2,3,5,6]
// Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
// The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

// My approach:
// 1. Grab first half of the first array up to the m
// 2. Add the second array to it
// 3. Sort the whole thing
// 4. Assign it back to the first array


// MARK: - Solution:
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    nums1 = (nums1[..<m] + nums2).sorted()
}

// MARK: - Tests
import XCTest

class MergeSortedArrayTests: XCTestCase {
    func testExample() {
        var nums1 = [1,2,3,0,0,0]
        let m = 3
        let nums2 = [2,5,6]
        let n = 3
        let output = [1,2,2,3,5,6]
        
        merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, output)
    }
    
    func testSecondArrayEmpty() {
        var nums1 = [1]
        let m = 1
        let nums2: [Int] = []
        let n = 0
        let output = [1]
        
        merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, output)
    }
    
    func testFirstArrayEmpty() {
        var nums1: [Int] = []
        let m = 0
        let nums2 = [1]
        let n = 1
        let output = [1]
        
        merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, output)
    }
}

MergeSortedArrayTests.defaultTestSuite.run()

//: [Next](@next)

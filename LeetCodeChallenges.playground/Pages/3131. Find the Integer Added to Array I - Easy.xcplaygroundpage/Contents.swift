//: [Previous](@previous)

import Foundation

// 3131. Find the Integer Added to Array I - Easy
// Link: https://leetcode.com/problems/find-the-integer-added-to-array-i/

// MARK: My Solution
func addedInteger(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let x = nums1.reduce(0, +)/nums1.count
    let z = nums2.reduce(0, +)/nums2.count
    return x.distance(to: z)
}

// MARK: - Other Solutions


// MARK: - Tests
import XCTest

class AddedIntegerTest: XCTestCase {
    func testExample() {
        let array1 = [2,6,4]
        let array2 = [9,7,5]
        XCTAssertEqual(addedInteger(array1, array2), 3)
    }
    
    func testExample2() {
        let array1 = [1,1,1,1]
        let array2 = [1,1,1,1]
        XCTAssertEqual(addedInteger(array1, array2), 0)
    }
    
    func testExample3() {
        let array1 = [10]
        let array2 = [5]
        XCTAssertEqual(addedInteger(array1, array2), -5)
    }
}


AddedIntegerTest.defaultTestSuite.run()

//: [Next](@next)

//: [Previous](@previous)

import Foundation


//27. Remove Element

/*
 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    guard nums.count > 0 else {
        return 0
    }

    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        if nums[i] == val {
            nums.remove(at: i)
        }
    }
    return nums.count
}

// Other Solutions:
func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
    nums = nums.filter { $0 != val }
    return nums.count
}

import XCTest

class TestRemovingSpecificElementsFromArray: XCTestCase {
    func testRemovingValues() {
        var input = [3,2,2,3]
        let value = 3
        XCTAssertEqual(removeElement(&input, value), 2)
    }
    
    func testEmptyArray() {
        var input: [Int] = []
        let value = 3
        XCTAssertEqual(removeElement(&input, value), 0)
    }
}

TestRemovingSpecificElementsFromArray.defaultTestSuite.run()

//: [Next](@next)

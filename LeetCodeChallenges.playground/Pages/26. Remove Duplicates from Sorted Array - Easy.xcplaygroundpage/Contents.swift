//: [Previous](@previous)

import Foundation

// 26. Remove Duplicates from Sorted Array

/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
 */

// MARK: - My Solution
func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return 0}
    var currentNum = nums[0]
    var count = 1
    for i in 1..<nums.count {
        if nums[i] == currentNum {
            nums.remove(at: i)
            nums.append(0)
        } else {
            currentNum = nums[i]
            count += 1
        }
    }
    
    return count
}

// MARK: - Tests
import XCTest

class RemoveDuplicates: XCTestCase {
    func testExample(){
        var input = [1, 1, 2]
        var output = removeDuplicates(&input)
        XCTAssertEqual(output, 2, "Failed on example test one")
    }
    
    func testExampleTwo(){
        var input = [0,0,1,1,1,2,2,3,3,4]
        var output = removeDuplicates(&input)
        XCTAssertEqual(output, 5, "Failed on example test two")
    }
}

RemoveDuplicates.defaultTestSuite.run()

//: [Next](@next)

//: [Previous](@previous)

import Foundation

// Contains Duplicates - Easy

// MARK: - Objective
// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.


 // MARK: - Example:

/*
 Input: nums = [1,2,3,1]
 Output: true
 Example 2:

 Input: nums = [1,2,3,4]
 Output: false
 Example 3:

 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */

// Guard statements and Bool value in dictionary makes the code slightly faster and more memory efficient. 4 ms faster, and 3.5 MB less memory.
// This solution ran at 572 ms, and 19.4 MB of memory
func containsDuplicate2(_ nums: [Int]) -> Bool {
    var dict: [Int: Bool] = [:]
    
    for num in nums {
        guard dict[num] == nil else {
            return true
        }
        dict[num] = true
    }
    
    return false
}

// This code ran at 576 ms, and used 22.7 MB of memory
func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int: String]()
        for num in nums {
            if let number = dict[num] {
                return true
            } else {
                dict[num] = "exists"
            }
        }
        return false
    }

// Other Solutions:

// Very Clever, and is more memory efficient
func containsDuplicate3(_ nums: [Int]) -> Bool {
    Set(nums).count != nums.count
}




import XCTest

class DuplicatesTests: XCTestCase {
    
    func testExample1(){
        XCTAssertEqual(containsDuplicate([1,2,3,1]), true)
        XCTAssertEqual(containsDuplicate2([1,2,3,1]), true)
        XCTAssertEqual(containsDuplicate3([1,2,3,1]), true)
    }
    
    func testExample2(){
        XCTAssertEqual(containsDuplicate([1,2,3,4]), false)
        XCTAssertEqual(containsDuplicate2([1,2,3,4]), false)
        XCTAssertEqual(containsDuplicate3([1,2,3,4]), false)
    }
    
    func testExample3(){
        XCTAssertEqual(containsDuplicate([1,1,1,3,3,4,3,2,4,2]), true)
        XCTAssertEqual(containsDuplicate2([1,1,1,3,3,4,3,2,4,2]), true)
        XCTAssertEqual(containsDuplicate3([1,1,1,3,3,4,3,2,4,2]), true)
    }
}

DuplicatesTests.defaultTestSuite.run()

//: [Next](@next)

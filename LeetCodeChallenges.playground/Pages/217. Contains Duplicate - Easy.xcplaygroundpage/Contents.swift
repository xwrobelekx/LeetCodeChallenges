//: [Previous](@previous)

import Foundation


/*
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.


 */



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


//Other solutions
//func containsDuplicate(_ nums: [Int]) -> Bool {
//        //nice one
//        return nums.count != Set(nums).count
//    }


/*
 Example 1:

 Input: nums = [1,2,3,1]
 Output: true
 Example 2:

 Input: nums = [1,2,3,4]
 Output: false
 Example 3:

 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */

import XCTest

class DuplicatesTests: XCTestCase {
    
    func testExample1(){
        XCTAssertEqual(containsDuplicate([1,2,3,1]), true, "Failed onExample 1")
    }
    
    func testExample2(){
        XCTAssertEqual(containsDuplicate([1,2,3,4]), false, "Failed onExample 2")
    }
    
    func testExample3(){
        XCTAssertEqual(containsDuplicate([1,1,1,3,3,4,3,2,4,2]), true, "Failed onExample 3")
    }
    
}

DuplicatesTests.defaultTestSuite.run()

//: [Next](@next)

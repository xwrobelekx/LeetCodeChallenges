//: [Previous](@previous)

import Foundation

/*
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.


 */



func search(_ nums: [Int], _ target: Int) -> Int {
    for (i, n) in nums.enumerated() {
        if n == target {
            return i
        }
    }
    return -1
}





import XCTest

class BinarySearchTests : XCTestCase {
    
    func testSampleOne(){
        XCTAssertEqual(search([-1,0,3,5,9,12], 9), 4, "Failed On sample test one")
    }
    
    func testNumberDoesntExists(){
        XCTAssertEqual(search([-1,0,3,5,9,12], 2), -1, "Failed On Number Doesnt Exists")
    }
    
    
}

BinarySearchTests.defaultTestSuite.run()


//: [Next](@next)

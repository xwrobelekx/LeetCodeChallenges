//: [Previous](@previous)

import Foundation

/*
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

  

 Example 1:

 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 Example 2:

 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
 
 */

// O(n)

func sortedSquares(_ nums: [Int]) -> [Int] {
    var squared : [Int] = []
    for num in nums {
        squared.append(num * num)
    }
    return squared.sorted()
}


//Other Solutions:
//func sortedSquares(_ nums: [Int]) -> [Int]{
//    return nums.map{$0 * $0}.sorted()
//}


import XCTest

class SortedSquaresTests : XCTestCase {
    
    func testExampleOne(){
        let input = [-4,-1,0,3,10]
        let output = [0,1,9,16,100]
        XCTAssertEqual(sortedSquares(input), output, "Failed On sample test one")
    }
    
    func testExampleTwo(){
        let input = [-7,-3,2,3,11]
        let output = [4,9,9,49,121]
        XCTAssertEqual(sortedSquares(input), output, "Failed On sample test two")
    }
    
}

SortedSquaresTests.defaultTestSuite.run()


















//: [Next](@next)

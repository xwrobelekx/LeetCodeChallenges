//: [Previous](@previous)

import Foundation

/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 A subarray is a contiguous part of an array.
 */

func maxSubArray(_ nums: [Int]) -> Int {

       if nums.isEmpty {
           return Int.min
       }
       var maxSum = nums[0]
       var currentSum = nums[0]
           
       for i in 1..<nums.count {
           let num = nums[i]
           let curMax = max(currentSum + num, num)
           maxSum = max(maxSum, curMax)
           currentSum = curMax
       }
       
       return maxSum
       
   }




import XCTest

class MaximumSubArrayTest: XCTestCase {
    
    func testExample1(){
        let input = [-2,1,-3,4,-1,2,1,-5,4]
        let output = 6
        XCTAssertEqual(maxSubArray(input), output, "❌Failed on test example 1")
    }
    
    func testExample2(){
        let input = [1]
        let output = 1
        XCTAssertEqual(maxSubArray(input), output, "❌Failed on test example 2")
    }
    
    func testExample3(){
        let input = [5,4,-1,7,8]
        let output = 23
        XCTAssertEqual(maxSubArray(input), output, "❌Failed on test example 3")
    }
    
    
    
}

MaximumSubArrayTest.defaultTestSuite.run()



//: [Next](@next)

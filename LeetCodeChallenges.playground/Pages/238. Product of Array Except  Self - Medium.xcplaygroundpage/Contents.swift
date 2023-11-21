//: [Previous](@previous)

import Foundation

// 238. Product of array except self

/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
 
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 
 You must write an algorithm that runs in O(n) time and without using the division operation.
 */


func productExceptSelf(_ nums: [Int]) -> [Int] {
    var last = 1
    var result: [Int] = []
    
    for i in 0..<nums.count {
        result.append(last)
        last *= nums[i]
    }
    
    last = 1
    for i in stride(from: nums.count-1, through: 0, by: -1){
        result[i] *= last
        last *= nums[i]
    }
    
    return result
}


// MARK: - Tests
import XCTest

class ProductExceptSelfTests : XCTestCase {
    func testExample1() {
         XCTAssertEqual(productExceptSelf([1, 2, 3, 4]), [24,12,8,6])
    }

    func testExample2() {
         XCTAssertEqual(productExceptSelf([-1,1,0,-3,3]), [0,0,9,0,0])
    }
    
    func testExample3() {
         XCTAssertEqual(productExceptSelf([0,0]), [0,0])
    }
}

ProductExceptSelfTests.defaultTestSuite.run()

//: [Next](@next)

//: [Previous](@previous)

import Foundation

/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
 
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 
 You must write an algorithm that runs in O(n) time and without using the division operation.
 */


func productExceptSelf(_ nums: [Int]) -> [Int] {

//    var output: [Int] = []
//    let maxNum = nums.reduce(1, *)
//    var maxNumwithoutZero = 1
//    for num in nums {
//        if num != 0 {
//        maxNumwithoutZero *= num
//        }
//    }
//
//    for num in nums{
//        if num != 0 {
//        let curNum = maxNum/num
//        output.append(curNum)
//        } else {
//
//            output.append(maxNumwithoutZero)
//        }
//    }
//
//    return output
    

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



import XCTest

class ProductExceptSelfTests : XCTestCase {
    
    func testExample1(){
         XCTAssertEqual(productExceptSelf([1, 2, 3, 4]), [24,12,8,6], "❌ Failed onExample 1")
    }

    func testExample2(){
         XCTAssertEqual(productExceptSelf([-1,1,0,-3,3]), [0,0,9,0,0], "❌ Failed onExample 2")
    }
    
    func testExample3(){
         XCTAssertEqual(productExceptSelf([0,0]), [0,0], "❌ Failed onExample 3")
    }
    
    
}

ProductExceptSelfTests.defaultTestSuite.run()

//: [Next](@next)

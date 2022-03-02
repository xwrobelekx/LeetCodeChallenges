//: [Previous](@previous)

import Foundation

/*
 Given an array, rotate the array to the right by k steps, where k is non-negative.

  

 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 
 
 */

//First Solution
func rotate(_ nums: inout [Int], _ k: Int) {

    if k > 0 {
    for _ in 1...k {
        let last = nums.removeLast()
        nums.insert(last, at: 0)
    }
    }
}

//Second Solution
////works for the most part but i keep on hitting edge cases
//func rotate(_ nums: inout [Int], _ k: Int) {
//    if k > 0 && nums.count >= 2 {
//        let slice = nums[(nums.count - k)...(nums.count - 1)]
//        let slice2 = nums[0..<(nums.count - k)]
//        nums = Array(slice) + Array(slice2)
//    } else {
//        
//    }
//}


//Other Solutions:
//func rotate(_ nums: inout [Int], _ k: Int) {
//    if k == 0 {
//        return
//    }
//    for _ in 1...k {
//        nums.insert(nums[nums.count-1], at: 0)
//        nums.removeLast()
//    }
//}



import XCTest


class RotateArrayTests : XCTestCase {
    
    func testExample1(){
        var input = [1,2,3,4,5,6,7]
        let k = 3
        let output = [5,6,7,1,2,3,4]
        rotate(&input, k)
        XCTAssertEqual(input, output, "Failed On sample test 1")
    }

    func testExample2(){
        var input = [-1,-100,3,99]
        let k = 2
        let output = [3,99,-1,-100]
        rotate(&input, k)
        XCTAssertEqual(input, output, "Failed On sample test 2")
    }

    func testKEqualsToZero(){
        var input = [1]
        let k = 0
        let output = [1]
        rotate(&input, k)
        XCTAssertEqual(input, output, "Failed On test K Equals To Zero")
    }

    func testKEqualsToOne(){
        var input = [1, 2]
        let k = 1
        let output = [2, 1]
        rotate(&input, k)
        XCTAssertEqual(input, output, "Failed On test K Equals To One")
    }
    
    
    func testKEqualsToTwo(){
        var input = [-1]
        let k = 2
        let output = [-1]
        rotate(&input, k)
        XCTAssertEqual(input, output, "Failed On test K Equals To One")
    }
    
    func testInputCountEquals2andKEquals3(){
        var input = [1, 2]
        let k = 3
        let output = [2, 1]
        rotate(&input, k)
        XCTAssertEqual(input, output, "Failed On test Input Count Equals 2 and K Equals 3")
    }
}



RotateArrayTests.defaultTestSuite.run()






//: [Next](@next)

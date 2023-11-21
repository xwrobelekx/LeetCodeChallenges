//: [Previous](@previous)

import Foundation

// 92. Single Number - Easy

// MARK: - Objective:
//Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
//You must implement a solution with a linear runtime complexity and use only constant extra space.


// MARK: - My Solution:
func singleNumber(_ nums: [Int]) -> Int {
    var dict: [Int: Int] = [:]
    
    for n in nums {
        if let existingNumber = dict[n] {
            dict[n] = nil
        } else {
            dict[n] = 1
        }
    }
    
    if let element = dict.first?.key {
        return element
    }
    
    return 0
}

// MARK: - Other Solutions
func singleNumber2(_ nums: [Int]) -> Int {
    var res = 0

    for num in nums {
        res = num^res
    }
    
    return res
}

// This solution is definitely interesting.
// It run the XOR operation on bits of first number or current value xORValue and the next number
// Which makes the number to go up or down, resulting in the correct output.
// Very clever
func singleNumber3(_ nums: [Int]) -> Int {
    var xOrValue: Int = 0
    
    nums.forEach { xOrValue = xOrValue ^ $0 }
    
    return xOrValue
}

func singleNumber4(_ nums: [Int]) -> Int {
  return nums.reduce(into: 0) { $0 ^= $1 }
}


// MARK: - Tests
import XCTest

class SingleNumberTests: XCTestCase {
    func testExampleOne() {
        XCTAssertEqual(singleNumber([2,2,1]), 1)
        XCTAssertEqual(singleNumber2([2,2,1]), 1)
        XCTAssertEqual(singleNumber3([2,2,1]), 1)
        XCTAssertEqual(singleNumber4([2,2,1]), 1)
    }
    
    func testExample2() {
        XCTAssertEqual(singleNumber([1]), 1)
        XCTAssertEqual(singleNumber2([1]), 1)
        XCTAssertEqual(singleNumber3([1]), 1)
        XCTAssertEqual(singleNumber4([1]), 1)
    }
    
    func testExample3() {
        XCTAssertEqual(singleNumber([4,1,2,1,2]), 4)
        XCTAssertEqual(singleNumber2([4,1,2,1,2]), 4)
        XCTAssertEqual(singleNumber3([4,1,2,1,2]), 4)
        XCTAssertEqual(singleNumber4([4,1,2,1,2]), 4)
    }
}

SingleNumberTests.defaultTestSuite.run()

//: [Next](@next)

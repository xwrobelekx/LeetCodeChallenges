//: [Previous](@previous)

import Foundation

// 66. Plus One - Easy
// arrays
// https://leetcode.com/problems/plus-one/description/

// My solution
// 0ms Run time, beats 100%, 17mb memory, beats 96%
func plusOne(_ digits: [Int]) -> [Int] {
    var nums = digits
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
        let currentNum = nums[i] + 1
        if i == 0 && currentNum == 10 {
            nums[i] = 0
            nums.insert(1, at: 0)
            break
        }
        if currentNum == 10 {
            nums[i] = 0
        } else {
            nums[i] = currentNum
            break
        }
    }

    return nums
}

// Other Solutions:
func plusOne2(_ digits: [Int]) -> [Int] {
    var tempDigits = digits
    for i in (0..<tempDigits.count).reversed() {
        guard tempDigits[i] == 9 else {
            tempDigits[i] += 1
            return tempDigits
        }
        tempDigits[i] = 0
    }
    tempDigits.insert(1, at: 0)
    return tempDigits
}



import XCTest

class TestPlusOne: XCTestCase {
    
    func testAddingOne() {
        let digits = [1, 2, 3]
        XCTAssertEqual(plusOne(digits), [1,2,4])
    }
    
    func testAddingOneWhenLastDigitIsNine() {
        let digits = [1, 2, 9]
        XCTAssertEqual(plusOne(digits), [1,3,0])
    }
    
    func testAddingOneWhenAllDigitsAreNine() {
        let digits = [9, 9]
        XCTAssertEqual(plusOne(digits), [1,0,0])
    }
    
    func testEmptyArray() {
        let digits: [Int] = []
        XCTAssertEqual(plusOne(digits), [])
    }
    
    func testOneElement() {
        let digits: [Int] = [9]
        XCTAssertEqual(plusOne(digits), [1,0])
    }
    
    func testAnotherOneElement() {
        let digits: [Int] = [8]
        XCTAssertEqual(plusOne(digits), [9])
    }
}

TestPlusOne.defaultTestSuite.run()

//: [Next](@next)

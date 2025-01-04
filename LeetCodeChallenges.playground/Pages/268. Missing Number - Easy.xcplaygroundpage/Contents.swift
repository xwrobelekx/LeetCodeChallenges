//: [Previous](@previous)

import Foundation

// 268. Missing Number - Easy

// My solution
// 11ms beats 11.8%, memory: 17mb, beats 43%
func missingNumber(_ nums: [Int]) -> Int {
    let sorted = nums.sorted()

    for i in 0..<sorted.count {
        if sorted[i] != i {
            return i
        }
    }
    return sorted.count
}

// Other Solutions:
func missingNumber2(_ nums: [Int]) -> Int {
    let n = nums.count
    let totalSum = n * (n + 1) / 2
    let arraySum = nums.reduce(0, +)
 return totalSum - arraySum
}

// Lots of people solve this by converting the array into a Set
// I guess the adventage of this is that Set give you O(n) look up time, to see if the number exist in the set.

import XCTest

class TestMissingOne: XCTestCase {
    
    func testOne() {
        let nums = [3,0,1]
        XCTAssertEqual(missingNumber(nums), 2)
    }
    
    func testTwo() {
        let nums = [0,1]
        XCTAssertEqual(missingNumber(nums), 2)
    }
    
    func testThree() {
        let nums = [9,6,4,2,3,5,7,0,1]
        XCTAssertEqual(missingNumber(nums), 8)
    }


}

TestMissingOne.defaultTestSuite.run()

//: [Next](@next)

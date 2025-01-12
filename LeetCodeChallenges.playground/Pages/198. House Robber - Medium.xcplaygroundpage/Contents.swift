//: [Previous](@previous)

import Foundation

// Name: 198. House Robber - Medium
// Link: https://leetcode.com/problems/house-robber/description/

// MARK: My Solution

// This was my approach but its not good for all the cases
//func rob(_ nums: [Int]) -> Int {
//    guard nums.count > 2 else {
//        return nums.max() ?? 0
//    }
//    var totalMoneyRobbedOnEvenSide = 0
//    var totalMoneyRobbedOnOddSide = 0
//    
//    
//    for i in stride(from: 0, to: nums.count-1, by: 2) {
//        totalMoneyRobbedOnEvenSide += nums[i]
//        totalMoneyRobbedOnOddSide += nums[i+1]
//    }
//    if nums.count % 2 == 1 {
//        totalMoneyRobbedOnEvenSide += nums[nums.count-1]
//    }
//    
//    return max(totalMoneyRobbedOnEvenSide, totalMoneyRobbedOnOddSide)
//}

// This one is simple but with help of online resources.
func rob(_ nums: [Int]) -> Int {
    var rob1 = 0
    var rob2 = 0
    
    for num in nums {
        let current = max(rob1 + num, rob2)
        rob1 = rob2
        rob2 = current
    }
    
    return max(rob1, rob2)
}



// MARK: - Other Solutions


// MARK: - Tests
import XCTest

class RobHousesTests: XCTestCase {
    func testRobbingHouseInNJ() {
        let houses: [Int] = [1,2,3,1]
        let expected: Int = 4
        
        XCTAssertEqual(expected, rob(houses))
    }
    
    func testRobbingHouseInCA() {
        let houses: [Int] = [2,7,9,3,1]
        let expected: Int = 12
        
        XCTAssertEqual(expected, rob(houses))
    }
    
    func testRobbingHouseInNY() {
        let houses: [Int] = [1, 2]
        let expected: Int = 2
        
        XCTAssertEqual(expected, rob(houses))
    }
    
    func testRobbingHouseInPA() {
        let houses: [Int] = [1,3,1]
        let expected: Int = 3
        
        XCTAssertEqual(expected, rob(houses))
    }
    
    func testRobbingHouseInAR() {
        let houses: [Int] = [1,1,1]
        let expected: Int = 2
        
        XCTAssertEqual(expected, rob(houses))
    }
    
    func testRobbingHouseInVA() {
        let houses: [Int] = [1,2,1,1]
        let expected: Int = 3
        
        XCTAssertEqual(expected, rob(houses))
    }
    
    func testRobbingHouseInTX() {
        let houses: [Int] = [2,1,1,2]
        let expected: Int = 4
        
        XCTAssertEqual(expected, rob(houses))
    }
    
}

RobHousesTests.defaultTestSuite.run()


//: [Next](@next)

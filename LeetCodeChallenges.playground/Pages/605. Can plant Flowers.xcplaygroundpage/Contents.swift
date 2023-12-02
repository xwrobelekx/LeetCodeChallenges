//: [Previous](@previous)

import Foundation

// 605. Can Plant Flowers

// MARK: - My Solution
func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var localFlowerbed = flowerbed
    var plantCount = n
        
    for (index, spot) in flowerbed.enumerated() {
        if plantCount == 0 {
            return true
        }
        
        if (index == 0 || localFlowerbed[index - 1] == 0) && 
            spot == 0 &&
            (index == localFlowerbed.count - 1 || localFlowerbed[index + 1] == 0) {
            localFlowerbed[index] = 1
            plantCount -= 1
        }
    }

    return plantCount == 0
}

// MARK: - Other Solutions
func canPlaceFlowers2(_ flowerbed: [Int], _ n: Int) -> Bool {
    var flowerbed2 = [0] + flowerbed + [0]
    var c = n
    
    for i in 1..<flowerbed2.count - 1 {
        if flowerbed2[i - 1] == 0 &&
            flowerbed2[i] == 0 &&
            flowerbed2[i + 1] == 0 {
            flowerbed2[i] = 1
            c -= 1
        }
    }
    
    return c <= 0
}

// MARK: - Tests
import XCTest

class CanPlantFlowersTests: XCTestCase {
    func testTruePlacement() {
        let flowerbed = [1,0,0,0,1]
        
        XCTAssertTrue(canPlaceFlowers(flowerbed, 1))
        XCTAssertTrue(canPlaceFlowers2(flowerbed, 1))
    }
    
    func testFalsePlacement() {
        let flowerbed = [1,0,0,0,1]
        
        XCTAssertFalse(canPlaceFlowers(flowerbed, 2))
        XCTAssertFalse(canPlaceFlowers2(flowerbed, 2))
    }
}

CanPlantFlowersTests.defaultTestSuite.run()


//: [Next](@next)

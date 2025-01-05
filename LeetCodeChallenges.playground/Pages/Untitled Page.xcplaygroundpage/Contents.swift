//: [Previous](@previous)

import Foundation

// 13. Roman to Integer
// Link: https://leetcode.com/problems/roman-to-integer/description/

// MARK: My Solution
func romanToInt(_ s: String) -> Int {
    let romanNumbers = Array(s)
    var total = 0
    var map: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var previous = 0
    
    for i in romanNumbers.reversed() {
        if let num = map[i] {
            if num < previous {
                total -= num
            } else {
                total += num
            }
            previous = num
        }
    }

    return total
}

// MARK: - Other Solutions




// MARK: - Tests
import XCTest

class RomanTointegerTests: XCTestCase {
    func testExampleOne() {
        let input = "III"
        XCTAssertEqual(romanToInt(input), 3)
    }
    
    func testExampleTwo() {
        let input = "LVIII"
        XCTAssertEqual(romanToInt(input), 58)
    }
    
    func testExampleThree() {
        let input = "MCMXCIV"
        XCTAssertEqual(romanToInt(input), 1994)
    }
}


RomanTointegerTests.defaultTestSuite.run()
//: [Next](@next)

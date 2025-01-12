//: [Previous](@previous)

import Foundation

//Name: 3270. Find the Key of the Numbers - Easy
// Link:

// MARK: My Solution
func generateKey(_ num1: Int, _ num2: Int, _ num3: Int) -> Int {
    let strArr = [String(num1), String(num2), String(num3)]
    let zeroPadding = strArr.map{Array(String(repeating: "0", count: 4 - $0.count) + $0)}
        
    var key = ""
    
    for i in 0...3 {
        key.append(min(zeroPadding[0][i], zeroPadding[1][i] , zeroPadding[2][i]))
    }
    
    return Int(key) ?? 0
}


// MARK: - Other Solutions


// MARK: - Tests
import XCTest

class KeyGeneratorTests: XCTestCase {
    func testExample1() {
        let num1 = 1
        let num2 = 10
        let num3 = 1000
        XCTAssertEqual(generateKey(num1, num2, num3), 0)
    }
    
    func testExample2() {
        let num1 = 987
        let num2 = 879
        let num3 = 789
        XCTAssertEqual(generateKey(num1, num2, num3), 777)
    }
    
    func testExample3() {
        let num1 = 1
        let num2 = 2
        let num3 = 3
        XCTAssertEqual(generateKey(num1, num2, num3), 1)
    }
}


KeyGeneratorTests.defaultTestSuite.run()

//: [Next](@next)

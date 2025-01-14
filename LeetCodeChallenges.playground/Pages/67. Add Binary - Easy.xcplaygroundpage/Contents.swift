//: [Previous](@previous)

import Foundation

// Name: 67. Add Binary - Easy

// Link:

// MARK: My Solution
// This works for majority of cases, but still fails
func addBinary(_ a: String, _ b: String) -> String {
    let intA = UInt128(a, radix: 2) ?? 0
    let intB = UInt128(b, radix: 2) ?? 0

    return String(intA + intB, radix: 2)
}


// Second attempt
//func addBinary(_ a: String, _ b: String) -> String {
//    var result = ""
//    var carry = 0
//    
//    var reversedA = Array(a).reverse()
//    print(reversedA)
//    var reversedB = Array(b).reverse()
//    
//    for i in 0..<max(reversedA.count, reversedB.count) {
//        let digitA = Int(String(reversedA[i])) ?? 0
//        let digitB = Int(String(reversedB[i])) ?? 0
//        
//        let sum = digitA + digitB + carry
//        result += (sum.isMultiple(of: 2) ? "0" : "1")
//        carry = sum/2
//    }
//    
//    if carry == 1 {
//        result += "1"
//    }
//    return result
//}



// MARK: - Other Solutions


// MARK: - Tests
import XCTest

class AddBinaryTests: XCTestCase {
    func testExample1() {
        let a = "11"
        let b = "1"
        let expected = "100"
        XCTAssertEqual(addBinary(a, b), expected)
    }
    
    func testExample2() {
        let a = "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101"
        let b = "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"
        let expected = "110111101100010011000101110110100000011101000101011001000011011000001100011110011010010011000000000"
        XCTAssertEqual(addBinary(a, b), expected)
    }

//    func testExample3() {
//        let a = "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
//        let b = "1"
//        let expected = "100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
//        XCTAssertEqual(addBinary(a, b), expected)
//    }
}


AddBinaryTests.defaultTestSuite.run()

//: [Next](@next)

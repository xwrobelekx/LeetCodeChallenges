//: [Previous](@previous)

import Foundation

func encode(str: [String]) -> String {
    str.joined(separator: "-/-")
}

func decode(str: String) -> [String] {
    str.components(separatedBy: "-/-")
}

import XCTest

class CoderTests: XCTestCase {
    
    func testOne() {
        let input = ["Kamil", "Laptop", "Cool"]
        let coded = encode(str: input)
        
        XCTAssertEqual(decode(str: coded), input)
    }
    
    func testTwo() {
        let input = [""]
        let coded = encode(str: input)
        
        XCTAssertEqual(decode(str: coded), input)
    }
}

CoderTests.defaultTestSuite.run()

//: [Next](@next)

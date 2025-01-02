//: [Previous](@previous)

import Foundation

// 14. Longest Common Prefix

// MARK: - My Solution
func longestCommonPrefix(_ strs: [String]) -> String {
    var commonPrefix = ""
    
    // NOT Solved Yet
    
//    var firstWord = strs[0]
//
//    for char in firstWord {
//        for word in strs {
//            let array = Array(word)
//            
//            if index == array.count - 1 || array[index] != Array(firstWord)[index] {
//                return commonPrefix
//            }
//            commonPrefix += Array(arrayLiteral: firstWord)[index]
//        }
//    }

    return commonPrefix
}

// MARK: - Other Solutions


// MARK: - Tests
import XCTest

class LongestCommonPrefixTests: XCTestCase {
    func testExample() {
        let strs = ["flower","flow","flight"]
        XCTAssertEqual(longestCommonPrefix(strs), "fl")
    }
}

LongestCommonPrefixTests.defaultTestSuite.run()

//: [Next](@next)

//: [Previous](@previous)

import Foundation

// 58. Length of Last Word - Easy
// Link: https://leetcode.com/problems/length-of-last-word/description/

// MARK: My Solution
// 6ms beats 14%, memory: 19mb beats 6%
func lengthOfLastWord(_ s: String) -> Int {
    var z = s.trimmingCharacters(in: .whitespacesAndNewlines)
    let array = z.components(separatedBy: " ")
    return array.last?.count ?? 0
}

// MARK: - Other Solutions
func lengthOfLastWord2(_ s: String) -> Int {
    var length = 0

    for char in s.reversed() {
        if char != " " {
            length += 1
        } else if length > 0 {
            return length
        }
    }
    
    return length
}

func lengthOfLastWord3(_ s: String) -> Int {
    let words = s.split(separator: " ").filter { !$0.isEmpty }
    return words.last?.count ?? 0
 }

func lengthOfLastWord4(_ s: String) -> Int {
    return s.split(separator: " ").last!.count
}

// MARK: - Tests
import XCTest

class LongestWordTests: XCTestCase {
    func testExample() {
        let input = "Hello World"
        XCTAssertEqual(lengthOfLastWord(input), 5)
    }
    
    func testExample2() {
        let input = "Today is a nice day"
        XCTAssertEqual(lengthOfLastWord(input), 3)
    }
    
    func testExample3() {
        let input = "   fly me   to   the moon  "
        XCTAssertEqual(lengthOfLastWord(input), 4)
    }
}


LongestWordTests.defaultTestSuite.run()

//: [Next](@next)

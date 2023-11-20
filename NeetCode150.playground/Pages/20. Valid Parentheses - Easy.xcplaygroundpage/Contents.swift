//: [Previous](@previous)

import Foundation

// Valid Parenthesis

// MARK: - My Solution
// 4ms, beats 52%, 14 MB beats 58%
func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    
    for char in s {
        switch char {
        case "(", "[", "{" :
            stack.append(char)
            
        case ")", "]", "}" :
            guard !stack.isEmpty else { return false }
            let poppedChar = stack.removeLast()
            if char == ")" && poppedChar != "(" {
                return false
            }
            if char == "]" && poppedChar != "[" {
                return false
            }
            if char == "}" && poppedChar != "{" {
                return false
            }
        default:
            return false
        }
    }
    
    if stack.isEmpty {
        return true
    } else {
        return false
    }
}

// MARK: - Other Solutions
// With my modifications
// 4ms, beats 52%, 14MB beats 75%
func isValid2(_ s: String) -> Bool {
    var stack: [Character] = []
    let bracketMatch: [Character: Character] = [")": "(", "}": "{", "]": "["]
    
    for char in s {
        if let last = stack.last, last == bracketMatch[char] {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    return stack.isEmpty
}


// MARK: - Tests
import XCTest

class ValidParenthesisTests: XCTestCase {
    func testExample() {
        XCTAssertTrue(isValid("()"))
        XCTAssertTrue(isValid2("()"))
    }
    
    func testCorrectBrackets() {
        XCTAssertTrue(isValid("()[]{}"))
        XCTAssertTrue(isValid2("()[]{}"))
    }
    
    func testInvalidClosingBracket() {
        XCTAssertFalse(isValid("(]"))
        XCTAssertFalse(isValid2("(]"))
    }
    
    func testOneOpenBracket() {
        XCTAssertFalse(isValid("["))
        XCTAssertFalse(isValid2("["))
    }
    
    func testOneCloseBracket() {
        XCTAssertFalse(isValid("}"))
        XCTAssertFalse(isValid2("}"))
    }
    
    func testTwoCloseBrackets() {
        XCTAssertFalse(isValid("}}"))
        XCTAssertFalse(isValid2("}}"))
    }
    
    func testTwoOpenBrackets() {
        XCTAssertFalse(isValid("(("))
        XCTAssertFalse(isValid2("(("))
    }
}

ValidParenthesisTests.defaultTestSuite.run()

//: [Next](@next)

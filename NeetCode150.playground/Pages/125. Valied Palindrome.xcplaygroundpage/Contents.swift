//: [Previous](@previous)

import Foundation

// 125. Valid Palindrome

// 37 ms beats 12%, 15.4 MB, beats 64%
func isPalindrome(_ s: String) -> Bool {
    // Removing all non alphanumeric characters
    let lowerCasedString = s.lowercased()
    let unsafeCharacters = CharacterSet.alphanumerics.inverted  // Remove the .inverted to get the opposite result.
    let cleanChars = lowerCasedString.components(separatedBy: unsafeCharacters).joined(separator: "")
    
    return cleanChars == String(cleanChars.reversed())
}

// MARK: - Other Solutions
func isPalindrome2(_ s: String) -> Bool {
    let s = s.lowercased().filter { $0.isLetter || $0.isNumber }
    return s == String(s.reversed())
}

// MARK: - Tests
import XCTest

class ValidPalindromeTests: XCTestCase {
    func testExample() {
        let input = "A man, a plan, a canal: Panama"
        XCTAssertEqual(isPalindrome(input), true)
        XCTAssertEqual(isPalindrome2(input), true)
    }
    
    func testExample2() {
        let input = "race a car"
        XCTAssertEqual(isPalindrome(input), false)
        XCTAssertEqual(isPalindrome2(input), false)
    }
    
    func testExample3() {
        let input = " "
        XCTAssertEqual(isPalindrome(input), true)
        XCTAssertEqual(isPalindrome2(input), true)
    }
}

ValidPalindromeTests.defaultTestSuite.run()

//: [Next](@next)

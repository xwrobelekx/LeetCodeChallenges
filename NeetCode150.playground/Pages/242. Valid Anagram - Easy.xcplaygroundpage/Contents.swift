//: [Previous](@previous)

import Foundation

// 242. Valid Anagram


// MARK: - My Solution
// Time complexity: linear O(n)
// 912 ms, beats 5%, 14.8 MB beats 98% of submissions
func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var r = s
    
    for char in t {
        if let index = r.firstIndex(of: char) {
            r.remove(at: index)
        } else {
            return false
        }
    }
    
    return true
}

// MARK: - Other Solutions
// Sorted string solution
// Time Complexity: O(n * log(n)) due to the sorting of the strings
// Space Complexity: = O(n) due to creating arrays for each string
func isAnagram2(_ s: String, _ t: String) -> Bool {
    s.sorted() == t.sorted()
}

// Dictionary Based Solution:
// Time Complexity: O(n), Space Complexity: O(k) where k is the number of unique characters in both strings
func isAnagram3(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }

    var dict = [Character: Int]()
    
    for char in s {
        // Nice on the default value
        dict[char, default: 0] += 1
    }
    
    for char in t {
        if let count = dict[char], count != 0 {
            dict[char] = count - 1
        } else {
            return false
        }
    }
    
    return true
}

// MARK: - Tests
import XCTest

class ValidAnagramTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(isAnagram("anagram", "nagaram"), true)
        XCTAssertEqual(isAnagram2("anagram", "nagaram"), true)
        XCTAssertEqual(isAnagram3("anagram", "nagaram"), true)

    }
    
    func testExample2() {
        XCTAssertEqual(isAnagram("rat", "car"), false)
        XCTAssertEqual(isAnagram2("rat", "car"), false)
        XCTAssertEqual(isAnagram3("rat", "car"), false)
    }
    
    func testExample3() {
        XCTAssertEqual(isAnagram("ab", "a"), false)
        XCTAssertEqual(isAnagram2("ab", "a"), false)
        XCTAssertEqual(isAnagram3("ab", "a"), false)
    }
}

ValidAnagramTests.defaultTestSuite.run()

//: [Next](@next)

//: [Previous](@previous)

import Foundation

// #. Challenge Name

// MARK: - My Solution

func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard !strs.isEmpty else {
        return [strs]
    }

    var pairs = [String: [String]]()

    for str in strs {
        let sortedStr = String(str.sorted())

        if var existingEntry = pairs[sortedStr] {
            existingEntry.append(str)
            pairs[sortedStr] = existingEntry
        } else {
            pairs[sortedStr] = [str]
        }
    }

    return Array(pairs.values)

}


// MARK: - Other Solutions
// Clever:

func groupAnagrams2(_ strs: [String]) -> [[String]] {
    Dictionary(grouping: strs, by: { String($0.sorted()) }).values.map { $0 }
}


// MARK: - Tests
import XCTest

class SortedAnagramsTests: XCTestCase {
    func testOne() {
        let input = ["a"]
        let output = [["a"]]
        XCTAssertEqual(groupAnagrams(input), output)
        XCTAssertEqual(groupAnagrams2(input), output)
    }
    
    func testTwo() {
        let input = [""]
        let output = [[""]]
        XCTAssertEqual(groupAnagrams(input), output)
        XCTAssertEqual(groupAnagrams2(input), output)
    }
    
    // This test is not good because were matching an exact output, but we can receive values in any order, and the output is still valid.
    /*
    func testThree() {
        let input = ["eat","tea","tan","ate","nat","bat"]
        let output = [["tan","nat"],["bat"],["eat","tea","ate"]]
        XCTAssertEqual(groupAnagrams(input), output)
        XCTAssertEqual(groupAnagrams2(input), output)
    }
     */
}

SortedAnagramsTests.defaultTestSuite.run()

//: [Next](@next)

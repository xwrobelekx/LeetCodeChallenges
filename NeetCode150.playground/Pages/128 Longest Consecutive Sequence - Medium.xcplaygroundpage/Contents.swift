//: [Previous](@previous)

import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count >= 1 else {
            return 0
    }
    let holder = Set(nums)
    let sortedNumbers = Array(holder).sorted()

    var currentSequence = 1
    var sequenceLength = 0

    for i in 1..<sortedNumbers.count {
        let previousNumber = sortedNumbers[i - 1]
        if (previousNumber + 1) == sortedNumbers[i] {
            currentSequence += 1
        } else {
            sequenceLength = max(sequenceLength, currentSequence)
            currentSequence = 1
        }
        
    }
    sequenceLength = max(sequenceLength, currentSequence)

    return sequenceLength
}

func longestConsecutive2(_ nums: [Int]) -> Int {
    let numbers = Set(nums)
    var longestSequence = 0
    
    for number in numbers {
        let previousNumber = number - 1
        if !numbers.contains(previousNumber) {
            // Start of a sequence
            var currentSequence = 1
            var currentNumber = number
            while numbers.contains(currentNumber + 1) {
                currentNumber += 1
                currentSequence += 1
            }
            longestSequence = max(longestSequence, currentSequence)
        }
    }
    
    
    return longestSequence
}

import XCTest

class LongestSequenceTests: XCTestCase {
    
    func testOne() {
        let input = [0,3,7,2,5,8,4,6,0,1]
        let output = 9
        
        XCTAssertEqual(longestConsecutive2(input), output)
    }
    
    func testEdgeCase() {
        let input = [0]
        let output = 1
        
        XCTAssertEqual(longestConsecutive2(input), output)
    }
    
    func testThree() {
        let input = [0, 0]
        let output = 1
        
        XCTAssertEqual(longestConsecutive2(input), output)
    }
    
    func testFour() {
        let input = [9,1,4,7,3,-1,0,5,8,-1,6]
        let output = 7
        
        XCTAssertEqual(longestConsecutive2(input), output)
    }
}

LongestSequenceTests.defaultTestSuite.run()

//: [Next](@next)

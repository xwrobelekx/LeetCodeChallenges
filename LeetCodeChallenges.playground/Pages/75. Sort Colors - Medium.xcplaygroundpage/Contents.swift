//: [Previous](@previous)

import Foundation

// Name: 75. Sort Colors- Medium
// Link: https://leetcode.com/problems/sort-colors/description/

// MARK: My Solution
// 0ms beats 100%, memory: 19mb beats 5%
func sortColors(_ nums: inout [Int]) {
    var zeros = 0
    var ones = 0
    var twos = 0

    for i in nums {
        switch i {
            case 0:
            zeros += 1
            case 1:
            ones += 1
            default:
            twos += 1
        }
    }

    nums = Array(repeating: 0, count: zeros)
    nums.append(contentsOf: Array(repeating: 1, count: ones))
    nums.append(contentsOf: Array(repeating: 2, count: twos))
}

// MARK: - Other Solutions
func sortColors2(_ nums: inout [Int]) {
    var buckets: [Int: Int] = [
        0: 0,
        1: 0,
        2: 0
    ]

    for i in nums {
        buckets[i]! += 1
    }

    nums =
        Array(repeating: 0, count: buckets[0]!) +
        Array(repeating: 1, count: buckets[1]!) +
        Array(repeating: 2, count: buckets[2]!)
}

func sortColors3(_ nums: inout [Int]) {
 var low = 0, high = nums.count - 1, index = 0
    while index <= high {
        if nums[index] == 0 {
            nums.swapAt(index, low)
            low += 1
            index += 1
        } else if nums[index] == 1 {
            index+=1
        } else {
            nums.swapAt(index, high)
            high -= 1
        }
    }
}

// MARK: - Tests
import XCTest

class SortColorsTests: XCTestCase {
    func testExample() {
        var input: [Int] = [2,0,2,1,1,0]
        sortColors(&input)
        XCTAssertEqual(input, [0,0,1,1,2,2])
    }
    
    func testExample2() {
        var input: [Int] = [0]
        sortColors(&input)
        XCTAssertEqual(input, [0])
    }
}


SortColorsTests.defaultTestSuite.run()


//: [Next](@next)

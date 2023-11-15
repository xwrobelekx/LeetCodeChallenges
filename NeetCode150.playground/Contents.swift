import UIKit

// 217. Contains Duplicates


// Previously I have used dictionary to track the values and their count, but sets are much faster.
// 583 ms, beats 63% users / 18.82 MB beats 49% of users
// Complexity: linear O(n), because it needs to iterate thru the array of numbers.
func containsDuplicate(_ nums: [Int]) -> Bool {
    var mySet: Set<Int> = []
    
    for num in nums {
        guard !mySet.contains(num) else {
            return true
        }
        mySet.insert(num)
    }
    
    return false
}

// MARK: Other Solutions
// Complexity: linear O(n)
func containsDuplicate2(_ nums: [Int]) -> Bool {
    nums.count != Set(nums).count
}

// MARK: - Tests
import XCTest

class ContainsDuplicatesTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(containsDuplicate([1,2,3,1]), true)
        XCTAssertEqual(containsDuplicate2([1,2,3,1]), true)
    }
    
    func testExample2() {
        XCTAssertEqual(containsDuplicate([1,2,3,4]), false)
        XCTAssertEqual(containsDuplicate2([1,2,3,4]), false)
    }
    
    func testExample3() {
        XCTAssertEqual(containsDuplicate([1,1,1,3,3,4,3,4,2]), true)
        XCTAssertEqual(containsDuplicate2([1,1,1,3,3,4,3,4,2]), true)
    }
}

ContainsDuplicatesTests.defaultTestSuite.run()

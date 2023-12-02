//: [Previous](@previous)

import Foundation

// 1299. Replace element with the greatest element on the right side

// MARK: - My Solution


// MARK: - Other Solutions
// Time complexity: O(n), Space complexity: O(1)
func replaceElements2(_ arr: [Int]) -> [Int] {
    var result = [Int](repeating: 0, count: arr.count)
    var maxVal = -1
    for i in (0..<arr.count).reversed() {
        let val = arr[i]
        result[i] = maxVal
        maxVal = max(val, maxVal)
    }
    return result
}

// MARK: - Tests
import XCTest

class ReplaceElementsTests: XCTestCase {
    func testExample() {
        var input = [17,18,5,4,6,1]
        var output = [18,6,6,6,1,-1]
        
        XCTAssertEqual(replaceElements2(input), output)
    }
    
    func testExample2() {
        var input = [400]
        var output = [-1]
        
        XCTAssertEqual(replaceElements2(input), output)
    }
}

ReplaceElementsTests.defaultTestSuite.run()



//: [Next](@next)

//: [Previous](@previous)

import Foundation
/*
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
 
 
 */

///Simulates an API call which returns Bool if the number is bad
func isBadVersion(_ version: Int, _ badNum: Int) -> Bool{
    version == badNum
}

func firstBadVersion(_ n: Int, _ badNum: Int) -> Int {
   var startIndex = 1
    var endIndex = n
    var currentNum = 0
    var out = -1
    while startIndex <= endIndex {
        currentNum = startIndex + ((endIndex - startIndex) / 2)
        if isBadVersion(currentNum, badNum) {
            endIndex = currentNum - 1
            out = currentNum
        } else {
             startIndex = currentNum + 1
        }
    }
return out
    
    
    //this works but its a bas solution because it goes thru every single number
//     for num in 1...n {
//         if isBadVersion(num){
//             return num
//         }
//     }
//     return 1
// }
}



//Best Solution:
//func firstBadVersion(_ n: Int) -> Int {
//       var left = 1
//       var right = n
//
//       while left < right {
//           let mid = left + (right-left)/2
//           if isBadVersion(mid) {
//               right = mid
//           } else {
//               left = mid + 1
//           }
//       }
//       return left
//   }

import XCTest

class FirstBadVersionTests : XCTestCase {
    func testSample(){
        XCTAssertEqual(firstBadVersion(5, 4), 4, "Failed On sample Test")
    }

    func testSampleTwo(){
        XCTAssertEqual(firstBadVersion(1, 1), 1, "Failed On sample Test Two")
    }
    
    func testSample3(){
        XCTAssertEqual(firstBadVersion(3, 3), 3, "Failed On sample Test 3")
    }
    
    func testSample4(){
        XCTAssertEqual(firstBadVersion(3, 2), 2, "Failed On sample Test 4")
    }
    
}


FirstBadVersionTests.defaultTestSuite.run()

//: [Next](@next)

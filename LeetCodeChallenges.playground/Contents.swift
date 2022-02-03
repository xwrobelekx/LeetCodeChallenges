import UIKit


/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.
 */




//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var output : [Int] = []
//
//    for (iIndex, iNumber) in nums.enumerated() {
//        for (jIndex, jNumber) in nums.enumerated() {
//            if iIndex != jIndex {
//               if (iNumber + jNumber) == target {
//                   output = [iIndex, jIndex]
//               }
//            }
//        }
//    }
//    return output
//}

//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//
//    var dictionary = [Int: Int]()
//    var result = [Int]()
//
//    for (index, number) in nums.enumerated(){
//        dictionary[number] = index
//    }
//
//    for (index, number) in nums.enumerated() {
//        let numberToFind = target - number
//        if let otherIndex = dictionary[numberToFind], otherIndex != index {
//            result = [otherIndex, index]
//        }
//    }
//
//    return result
//}



//Other Solutions:
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var dict: [Int:Int] = [:]
       for i in 0..<nums.count {
           print(dict)
           if let num = dict[target - nums[i]] {
               return [i, num]
           } else {
               dict[nums[i]] = i
           }
       }
       return [0, 0]
   }



////Other solution - least amout of memory
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var ans = [Int]()
//    for i in 0..<nums.count-1{
//        //second loop iterated thru the reminder of array no the whole thing
//        for j in i+1..<nums.count{
//            if nums[i]+nums[j]==target{
//                ans.append(i)
//                ans.append(j)
//                return ans
//            }
//
//        }
//    }
//    return ans
//}








import XCTest


class TwoSumTests : XCTestCase {
    

    func testExampleOne() {
        let inputNumers = [2,7,11,15]
        let target = 9
        let expectation = [1,0]
        let result = twoSum(inputNumers, target)
        
        XCTAssertEqual(result.sorted(), expectation.sorted(), "❌ Failed on example test One")
    }
    

    func testExampleTwo(){

        let result = twoSum([3,2,4], 6)
        let expectation = [1,2]
        XCTAssertEqual(result.sorted(), expectation.sorted(), "❌ Failed on example test Two")
    }

    func testExampleThree(){
        let result = twoSum([3,3], 6)
        let expectation = [0,1]
        XCTAssertEqual(result.sorted(), expectation.sorted(), "❌ Failed on example test Three")
    }

    func testForANumberInTheMiddle(){
        let input = [3, 2, 3, 2, 5]
        let target = 6
        let result = twoSum(input, target)
        let output = [0,2]
        XCTAssertEqual(result.sorted(), output.sorted(), "❌ Failed on Number in the Middle" )
    }

}



TwoSumTests.defaultTestSuite.run()

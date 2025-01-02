//: [Previous](@previous)

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    // This dictionary will hold the values of the number mapped to the tuple which will have the frequency and the number itself
    var dict = [Int: (frequency: Int, number: Int)]()

    for num in nums {
        if dict[num] != nil {
            var value = dict[num]
            value?.frequency += 1
            dict[num] = value
        } else {
            dict[num] = (1, num)
        }
    }

    var values = Array(dict.values)
//    print(values)
    values.sort{ $0.frequency > $1.frequency }
    
    var array = [Int]()
    for value in values {
        array.append(value.number)
    }


    return Array(array[0..<k])
}


import XCTest

class TopKFrequentTests: XCTestCase {
    
//    func testOne() {
//        let input = [1,1,1,2,2,3]
//        let frequency = 2
//        let output = [1, 2]
//        XCTAssertEqual(topKFrequent(input, frequency), output)
//    }
    
    func testTwo() {
        let input = [4,1,-1,2,-1,2,3]
        let frequency = 2
        let output = [2, -1]
        XCTAssertEqual(topKFrequent(input, frequency), output)
    }
    
}

//: [Next](@next)

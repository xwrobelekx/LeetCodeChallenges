//: [Previous](@previous)

import Foundation

// 21. Merge Two Sorted Linked Lists - Easy

class ListNode {
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

// MARK: - My Solution
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var mergedList: ListNode? = list1
    var currentNode1 = list1
    var currentNode2 = list2
    
    while currentNode1?.next != nil && currentNode2?.next != nil {
        if let value1 = currentNode1?.val, let value2 = currentNode2?.val {
            
            if value1 <= value2 {
                mergedList?.next = currentNode1
                currentNode1 = currentNode1?.next
            } else {
                mergedList?.next = currentNode2
                currentNode2 = currentNode2?.next
            }
        }
    }
    
    return mergedList?.next
}

// MARK: - Other Solutions


// MARK: - Tests
import XCTest

class MergeTwoSortedLikedListsTest: XCTestCase {
    func testExample() {
        let inputOne = [1, 2, 3, 4, 5]
        let inputTwo = [1, 2, 2, 6]
        let linkedListOne = parse(inputOne)
        let linkedListTwo = parse(inputTwo)
        
        let merged = mergeTwoLists(linkedListOne, linkedListTwo)
        
        XCTAssertEqual(merged?.description, "1 -> 1 -> 2 -> 2 -> 2 -> 3 -> 4 -> 5 -> 6")
    }
}

class HelpersTests: XCTestCase {
    func testParsingArrayToLinkedList() {
        XCTAssertEqual(parse([1,2,3,4,5]).description, "1 -> 2 -> 3 -> 4 -> 5")
    }
    
    func testConvertingLinkedListToArray() {
        let inputArray = [1,2,3,4,5]
        let linkedList = parse(inputArray)
        
        let returnedArray = convert(linkedList: linkedList)
        
        XCTAssertEqual(inputArray, returnedArray)
    }
}

// MARK: -  Helpers
func parse(_ numbers: [Int]) -> ListNode {
    var currentNode: ListNode = ListNode(999)
    let node: ListNode = currentNode
    
    for number in numbers {
        let newNode = ListNode(number)
        currentNode.next = newNode
        currentNode = currentNode.next!
    }
    
    return node.next ?? ListNode(000)
}

func convert(linkedList node: ListNode) -> [Int] {
    var currentNode = node
    var numbers: [Int] = []
    
    while currentNode.next != nil {
        numbers.append(currentNode.val)
        currentNode = currentNode.next!
    }
    
    numbers.append(currentNode.val)
    
    return numbers
}
    
extension ListNode: CustomStringConvertible {
    var description: String {
        if let nextNode = next {
            return "\(val) -> \(nextNode.description)"
        } else {
            return "\(val)"
        }
    }
}

MergeTwoSortedLikedListsTest.defaultTestSuite.run()

//: [Next](@next)

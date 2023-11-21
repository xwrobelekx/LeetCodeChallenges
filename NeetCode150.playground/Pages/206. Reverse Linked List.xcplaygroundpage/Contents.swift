//: [Previous](@previous)

import Foundation

// 206. Reverse Linked List

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

// MARK: - My Solution:
// 13 ms beats 46%, 14MB beats 99%
func reverseList(_ head: ListNode?) -> ListNode? {
    var currentNode = head
    var previousNode: ListNode? = nil
    
    while currentNode != nil {
        let temp = currentNode?.next
        currentNode?.next = previousNode
        previousNode = currentNode
        currentNode = temp
    }
    
    return previousNode
}

// MARK: - Other Solutions

// MARK: - Tests
import XCTest

class ReverseLinkedListTest: XCTestCase {
    func testExample() {
        let input = [1, 2, 3, 4, 5]
        let linkedList = parse(input)
        
        let reversed = reverseList(linkedList)
        
        let numbers = convert(linkedList: reversed!)
        XCTAssertEqual(input.reversed(), numbers)
    }
}
    
//MARK: -  Helpers
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

ReverseLinkedListTest.defaultTestSuite.run()

//: [Next](@next)

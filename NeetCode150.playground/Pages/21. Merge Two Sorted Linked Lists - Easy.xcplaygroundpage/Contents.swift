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
// This solutions fails on some tests
//func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//    var currentNode1 = list1
//    var currentNode2 = list2
//    var currentNode: ListNode? = ListNode()
//    let mergedList = currentNode
//    
//    while currentNode1 != nil {
//        if let value1 = currentNode1?.val, let value2 = currentNode2?.val {
//            if value1 <= value2 {
//                currentNode?.next = currentNode1
//                currentNode1 = currentNode1?.next
//            } else {
//                currentNode?.next = currentNode2
//                currentNode2 = currentNode2?.next
//            }
//            currentNode = currentNode?.next
//        }
//    }
//    
//    currentNode?.next = currentNode1 != nil ? currentNode1 : currentNode2
//    
//    return mergedList?.next
//}

func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var mergedList: ListNode? = ListNode()
    var currentNode : ListNode? = mergedList
    var node1 = l1
    var node2 = l2
    
    while node1 != nil && node2 != nil {
        if node1!.val <= node2!.val {
            currentNode?.next = node1
            node1 = node1?.next
        } else {
            currentNode?.next = node2
            node2 = node2?.next
        }
        currentNode = currentNode?.next
    }
    
    if node1 == nil {
        currentNode?.next = node2
    }
    
    if node2 == nil {
        currentNode?.next = node1
    }
    
    return mergedList?.next
}



// MARK: - Other Solutions
//func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//    var list1 = list1
//    var list2 = list2
//    let dummy: ListNode? = ListNode()
//    var node = dummy
//    
//    while list1 != nil, list2 != nil {
//        if let value1 = list1?.val, let value2 = list2?.val {
//            if value1 < value2 {
//                node?.next = list1
//                list1 = list1?.next
//            } else{
//                node?.next = list2
//                list2 = list2?.next
//            }
//        }
//        
//        node = node?.next
//    }
//    
//    node?.next = list1 != nil ? list1 : list2
//    return dummy?.next
//
//

// Recursive Solution
func mergeTwoLists3(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    if list1 == nil || list2 == nil {
        return list1 == nil ? list2 : list1
    }
    
    if list1!.val <= list2!.val {
        list1?.next = mergeTwoLists3(list1?.next, list2)
        return list1
    } else {
        list2?.next = mergeTwoLists3(list1, list2?.next)
        return list2
    }
}

// MARK: - Tests
import XCTest

class MergeTwoSortedLikedListsTest: XCTestCase {
    func testExample() {
        let inputOne = [1, 2, 3, 4, 5]
        let inputTwo = [1, 2, 2, 6]
        let linkedListOne = parse(inputOne)
        let linkedListTwo = parse(inputTwo)
        
//        let merged = mergeTwoLists(linkedListOne, linkedListTwo)
//        let merged2 = mergeTwoLists2(linkedListOne, linkedListTwo)
        let merged3 = mergeTwoLists3(linkedListOne, linkedListTwo)
        
//        XCTAssertEqual(merged?.description, "1 -> 1 -> 2 -> 2 -> 2 -> 3 -> 4 -> 5 -> 6")
//        XCTAssertEqual(merged2?.description, "1 -> 1 -> 2 -> 2 -> 2 -> 3 -> 4 -> 5 -> 6")
        XCTAssertEqual(merged3?.description, "1 -> 1 -> 2 -> 2 -> 2 -> 3 -> 4 -> 5 -> 6")
    }
    
    func testWithOneEmptyList() {
        let inputOne = [1]
        let inputTwo: [Int] = []
        let linkedListOne = parse(inputOne)
        let linkedListTwo = parse(inputTwo)
        
//        let merged = mergeTwoLists(linkedListOne, linkedListTwo)
//        let merged2 = mergeTwoLists2(linkedListOne, linkedListTwo)
        let merged3 = mergeTwoLists3(linkedListOne, linkedListTwo)
        
//        XCTAssertEqual(merged?.description, "1")
//        XCTAssertEqual(merged2?.description, "1")
        XCTAssertEqual(merged3?.description, "1")
        
    }
}

class HelpersTests: XCTestCase {
    func testParsingArrayToLinkedList() {
        XCTAssertEqual(parse([1,2,3,4,5])?.description, "1 -> 2 -> 3 -> 4 -> 5")
    }
    
    func testParsingEmptyArray() {
        XCTAssertNil(parse([])?.description)
    }
    
    func testConvertingLinkedListToArray() {
        let inputArray = [1,2,3,4,5]
        let linkedList = parse(inputArray)
        
        let returnedArray = convert(linkedList: linkedList)
        
        XCTAssertEqual(inputArray, returnedArray)
    }
    
    func testConvertingEmptyLinkedListToArray() {
        let inputArray: [Int] = []
        let linkedList = parse(inputArray)
        
        let returnedArray = convert(linkedList: linkedList)
        
        XCTAssertEqual(inputArray, returnedArray)
    }
}

// MARK: -  Helpers
func parse(_ numbers: [Int]) -> ListNode? {
    guard !numbers.isEmpty else { return nil }
    
    var currentNode: ListNode = ListNode(999)
    let node: ListNode = currentNode
    
    for number in numbers {
        let newNode = ListNode(number)
        currentNode.next = newNode
        currentNode = currentNode.next!
    }
    
    return node.next
}

func convert(linkedList node: ListNode?) -> [Int] {
    var currentNode = node
    var numbers: [Int] = []

    if node == nil {
        return numbers
    }
    
    while currentNode?.next != nil {
        if let val = currentNode?.val {
            numbers.append(val)
            currentNode = currentNode?.next!
        }
    }
    
    if let val = currentNode?.val {
        numbers.append(val)
    }
    
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

//HelpersTests.defaultTestSuite.run()
MergeTwoSortedLikedListsTest.defaultTestSuite.run()

//: [Next](@next)

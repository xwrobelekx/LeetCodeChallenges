//: [Previous](@previous)

import Foundation

// 929. Unique emails

// MARK: - My Solution
func numUniqueEmails(_ emails: [String]) -> Int {
    var uniqueEmails = Set<String>()

    for email in emails {
        let splitEmail = email.split(separator: "@")
        var localName = splitEmail[0]
        var domainName = splitEmail[1]
        
        var plusIndex = localName.firstIndex(of: "+")
        var localNameWithRemovedPlus = localName.split(separator: "+")[0]
        
        localNameWithRemovedPlus = localNameWithRemovedPlus.filter { $0 != "." }
        
        let newMail = String(localNameWithRemovedPlus + "@" + domainName)
        uniqueEmails.insert(newMail)
    }

    return uniqueEmails.count
}


// MARK: - Tests
import XCTest

class UniqueEmailTests: XCTestCase {
    func testRegularEmails() {
        let emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
        XCTAssertEqual(numUniqueEmails(emails), 3)
    }
    
    func testEmailsWithDots() {
        let emails = ["test.email+alex@leetcode.com",
                      "test.e.mail+bob.cathy@leetcode.com",
                      "testemail+david@lee.tcode.com"]
        XCTAssertEqual(numUniqueEmails(emails), 2)
    }

    
    func testEmails2() {
        let emails = ["test.email+alex@leetcode.com", "test.email.leet+alex@code.com"]
        XCTAssertEqual(numUniqueEmails(emails), 2)
    }
}

UniqueEmailTests.defaultTestSuite.run()

//: [Next](@next)

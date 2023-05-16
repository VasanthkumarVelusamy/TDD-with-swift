//
//  TDD_with_Swift_First_UTTests.swift
//  TDD with Swift First UTTests
//
//  Created by Vasanth Kumar on 13/05/23.
//

import XCTest
@testable import TDD_with_Swift_First_UT

final class TDD_with_Swift_First_UTTests: XCTestCase {

    var blogger: Blogger!
    
    override func setUpWithError() throws {
        blogger = Blogger()
    }

    override func tearDownWithError() throws {
        blogger = nil
    }

    func test_numberOfVowels_whenGivenDominik_shouldReturn3() {

      let viewController = ViewController()

      let result = viewController.numberOfVowels(in: "Dominik")

      XCTAssertEqual(result, 3,

        "Expected 3 vowels in 'Dominik' but got \(result)")

    }
    
    func test_makeHeadline_shouldCapitalisePassedInString() {
        let input = "the Accessibility inspector"
        let result = blogger.makeHeadline(from: input)
        let expected = "The Accessibility Inspector"
        XCTAssertEqual(result, expected)
    }
    
    func test_makeHeadline_shouldCapitalisePassedInString_2() {
        let input = "the contextual action menu"
        let result = blogger.makeHeadline(from: input)
        let expected = "The Contextual Action Menu"
        XCTAssertEqual(result, expected)
    }
    
    //
    // TDD example #1:- Custom assert function
    //
    // Adding custom assert method helps to show accurate failure reason by adding custom logic like the one in DDHAssertEqual method below.
    func dictsAreQual() {

      let dict1 = ["id": "2", "name": "foo"]

      let dict2 = ["id": "2", "name": "fo"]

      DDHAssertEqual(dict1, dict2)

    }
    
    /// Adding file: StaticString = #filePath and line: UInt = #line make the error appear in the test function where this assert method is called/ Otherwise the error would appear in this method only.
    func DDHAssertEqual<A: Equatable, B: Equatable>
      (_ first: [A:B],
       _ second: [A:B],
       file: StaticString = #filePath,
       line: UInt = #line) {

      if first == second {
        return
      }

      for key in first.keys {
        if first[key] != second[key] {
          let value1 = String(describing: first[key]!)
          let value2 = String(describing: second[key]!)
          let keyValue1 = "\"\(key)\": \(value1)"
          let keyValue2 = "\"\(key)\": \(value2)"
          let message = "\(keyValue1) is not equal to \(keyValue2)"
          XCTFail(message, file: file, line: line)
          return
        }
      }
    }
}

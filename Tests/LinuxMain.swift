import XCTest

import UnstringifiedTests
import UnstringifyTests

var tests = [XCTestCaseEntry]()
tests += UnstringifiedTests.__allTests()
tests += UnstringifyTests.__allTests()

XCTMain(tests)

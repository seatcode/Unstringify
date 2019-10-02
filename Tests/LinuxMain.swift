import XCTest

import FindAndroidStringsTests
import FindStringsTests
import UnstringifiedTests
import UnstringifyFrameworkTests
import UnstringifyTests

var tests = [XCTestCaseEntry]()
tests += FindAndroidStringsTests.__allTests()
tests += FindStringsTests.__allTests()
tests += UnstringifiedTests.__allTests()
tests += UnstringifyFrameworkTests.__allTests()
tests += UnstringifyTests.__allTests()

XCTMain(tests)

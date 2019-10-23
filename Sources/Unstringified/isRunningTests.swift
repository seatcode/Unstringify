import Foundation

public var isRunningTests: Bool = {
    #if UITESTING
    return true
    #endif

    return NSClassFromString("XCTestCase") != nil
}()

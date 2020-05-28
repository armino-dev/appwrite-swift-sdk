import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(appwrite_swift_sdkTests.allTests),
    ]
}
#endif

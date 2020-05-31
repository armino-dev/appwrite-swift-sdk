import XCTest
@testable import AppwriteSwiftSDK

final class AppwriteSwiftSDKTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AppwriteSwiftSDK().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

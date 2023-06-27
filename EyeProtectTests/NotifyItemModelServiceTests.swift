//
//  NotifyItemModelServiceTests.swift
//  EyeProtectTests
//
//  Created by Feyoe on 2023/6/27.
//

import XCTest
@testable import EyeProtect

final class NotifyItemModelServiceTests: XCTestCase {
    var service: NotifyItemModelService?
    override func setUpWithError() throws {
        service = NotifyItemModelService()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncodeAndDecode() {
        let items = [
            NotifyItem(title: "Item0", message: "Item0Message", repeatInterval: 10),
            NotifyItem(title: "Item1", message: "Item1Message", repeatInterval: 20)
        ]
        service?.items = items
        service?.writeToFile()
        service?.items = []
        let afterItems = service?.allNotifyItems()
        XCTAssertTrue(items == afterItems, "items not equal")
    }

}

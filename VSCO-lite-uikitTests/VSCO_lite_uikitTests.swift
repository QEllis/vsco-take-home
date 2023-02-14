//
//  VSCO_lite_uikitTests.swift
//  VSCO-lite-uikitTests
//
//  Created by Quinn Ellis on 2/14/23.
//

import XCTest

final class VSCO_lite_uikitTests: XCTestCase {

    let badDataParseDict: [String: Any] = ["data": ["id": 1]]

    func testExample() throws {
        let flickrPhoto = FlickrPhoto(data: badDataParseDict)
        XCTAssert(flickrPhoto == nil)
    }

}

//
//  ItemTests.swift
//  ABCNewsTests
//
//  Created by Nafisa Rahman on 4/8/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import XCTest
@testable import ABCNews

class ItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testItem() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let string = """
            {
                     "title":"No time to lounge around as hundreds turn out for couch surfing race",
                     "pubDate":"2018-04-18 08:37:22",
                     "link":"http:\\/\\/www.abc.net.au\\/news\\/2018-04-18\\/hundreds-descend-on-darwin-for-seventh-annual-couch-surfing-race\\/9672606",
                     "guid":"http:\\/\\/www.abc.net.au\\/news\\/2018-04-18\\/hundreds-descend-on-darwin-for-seventh-annual-couch-surfing-race\\/9672606",
                     "author":"Phoebe Hosier",
                     "thumbnail":"http:\\/\\/www.abc.net.au\\/news\\/image\\/9673072-4x3-140x105.jpg",
                     "description":"<p>More than a dozen teams from across the NT converge on Darwin to show off their skills, and sofas, in a bid to highlight youth homelessness.<\\/p>",
                     "content":"<p>More than a dozen teams from across the NT converge on Darwin to show off their skills, and sofas, in a bid to highlight youth homelessness.<\\/p>",
                     "enclosure":{
                              "link":"http:\\/\\/www.abc.net.au\\/news\\/image\\/9673072-16x9-2150x1210.jpg",
                              "type":"image\\/jpeg",
                              "thumbnail":"http:\\/\\/www.abc.net.au\\/news\\/image\\/9673072-4x3-140x105.jpg"
                }
            }
            """
        let data = string.data(using: .utf8)
        let result = try JSONDecoder().decode(Item.self, from:data! )
        
        XCTAssertEqual(result.title,"No time to lounge around as hundreds turn out for couch surfing race")
        
        XCTAssertEqual(result.pubDate, "2018-04-18 08:37:22")
        
        XCTAssertEqual(result.link, "http://www.abc.net.au/news/image/9673072-16x9-2150x1210.jpg")
        
        XCTAssertEqual(result.thumbnail, "http://www.abc.net.au/news/image/9673072-4x3-140x105.jpg")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

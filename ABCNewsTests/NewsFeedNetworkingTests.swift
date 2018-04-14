//
//  NewsFeedNetworkingTests.swift
//  ABCNewsTests
//
//  Created by Nafisa Rahman on 4/8/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import XCTest

class NewsFeedNetworkingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let myUrl = "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml"
        
        let url = URL(string: myUrl)!
        let urlExpectation = expectation(description: "GET \(url)")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let response = response as? HTTPURLResponse,
                let responseURL = response.url
                 
            {
                XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
                
                XCTAssertEqual(response.statusCode, 200, "HTTP response status code should be 200")
                
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
            
            
            urlExpectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

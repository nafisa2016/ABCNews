//
//  NewsTableViewController.swift
//  ABCNewsTests
//
//  Created by Nafisa Rahman on 4/8/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import XCTest
@testable import ABCNews

class NewsTableViewControllerTests: XCTestCase {
    
    var newsTableViewController : NewsTableViewController!
    var navigation : UINavigationController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        newsTableViewController = storyboard.instantiateViewController(withIdentifier: "newsTableViewController") as! NewsTableViewController
        
        
        navigation = UINavigationController()
        navigation.viewControllers = [newsTableViewController]

        newsTableViewController.loadView()
        newsTableViewController.viewDidLoad()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableViewExists() {
        
        XCTAssertNotNil(newsTableViewController.tableView)
    }
    
    func testToDoTableViewControllerHasNavigationController() {
        
        XCTAssertNotNil(newsTableViewController.navigationController)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

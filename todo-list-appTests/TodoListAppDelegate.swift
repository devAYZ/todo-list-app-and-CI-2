//
//  TodoListAppDelegate.swift
//  todo-list-appTests
//
//  Created by Ayokunle on 15/03/2021.
//

import XCTest
@testable import todo_list_app

class TodoListAppDelegate: XCTestCase {
    
    var todoList: AppDelegate!

    override func setUpWithError() throws {
        todoList = AppDelegate()
    }

    override func tearDownWithError() throws {
        todoList = nil
        super.tearDown()
    }

    func testCoreDataSave() throws {
        XCTAssertNotNil(todoList.saveContext())
    }


}

//
//  TodoListHomePage.swift
//  todo-list-appTests
//
//  Created by Ayokunle on 15/03/2021.
//

import XCTest
@testable import todo_list_app

class TodoListHomePage: XCTestCase {
    
    var todoList: HomePageViewController!

    override func setUpWithError() throws {
        todoList = HomePageViewController()
    }

    override func tearDownWithError() throws {
        todoList = nil
        super.tearDown()
    }

    func testAddTodoList() throws {
        XCTAssertNotNil(todoList.addList())
    }
    
    func testViewTodoList() throws {
        XCTAssertNotNil(todoList.viewList())
    }
    
}

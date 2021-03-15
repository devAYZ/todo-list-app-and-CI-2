//
//  TodoListSceneDelegate.swift
//  todo-list-appTests
//
//  Created by Ayokunle on 15/03/2021.
//

import XCTest
@testable import todo_list_app

class TodoListTable: XCTestCase {
    
    var todoList: TodoListTableViewController!

    override func setUpWithError() throws {
        todoList = TodoListTableViewController()
    }

    override func tearDownWithError() throws {
        todoList = nil
        super.tearDown()
    }
    
    func testNavigationTitle () throws {
        XCTAssertNil(todoList.navigationItem.title)
    }
    
    func testModelCount () throws {
        XCTAssertEqual(todoList.models.count, 0)
    }
    
    func testTodoListView () throws {
        XCTAssertNotNil(todoList.viewDidLoad())
    }
    
    func testTodoListAddButton() throws {
        XCTAssertNotNil(todoList.addButtonTapped())
    }
    
    func testTodoItems() throws {
        XCTAssertNotNil(todoList.getAllItems())
    }
    
    func testTodoListCreateItem() throws {
        XCTAssertNotNil(todoList.createItem(name: "item1"))
    }

}

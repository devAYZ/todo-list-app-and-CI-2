//
//  TodoListModelTest.swift
//  todo-list-appTests
//
//  Created by Ayokunle on 12/03/2021.
//

import XCTest
import CoreData 
@testable import todo_list_app


class TodoListModelTest: XCTestCase {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var todoListData: TodoListItem!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        todoListData = TodoListItem(context: context)
        todoListData.name = "todoitem1"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        todoListData = nil
        super.tearDown()
    }
    

    func testEmptyTodoList () throws {
        
        XCTAssertNotNil(todoListData)
    }
    
    func testTodoListStringLength () throws {
        guard let name = todoListData.name else { return }
        XCTAssertGreaterThanOrEqual(name.count, 2)
    }
    
    func testTodoListFirstNotWhiteSpace () throws {
        guard let name = todoListData.name else { return }
        XCTAssertNotEqual(name.first, " ")
    }

}

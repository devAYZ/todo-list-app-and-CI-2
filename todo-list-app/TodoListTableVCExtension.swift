//
//  TodoListTableVCExtension.swift
//  todo-list-app
//
//  Created by Ayokunle on 24/02/2021.
//

import Foundation
import UIKit

extension TodoListTableViewController {
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = models[indexPath.row]
        
        let editText = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        
        let editAlertAction = UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
            //
            
            let alert = UIAlertController(title: "EDIT ITEM", message: "Edit Your Todo Item", preferredStyle: .alert)
//            alert.addTextField(configurationHandler: nil)
//
//            alert.textFields?.first?.text = item.name
            alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
                let heightConstraint = NSLayoutConstraint(item: textField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
                textField.addConstraint(heightConstraint)
                
        })

            alert.textFields?.first?.text = item.name
            
            alert.addAction(UIAlertAction(title: "Update Item", style: .cancel, handler: { [weak self] _ in
                guard let textfield = alert.textFields?.first, let newTask = textfield.text, !newTask.isEmpty else { return }
                
                self?.updateItem(item: item, newName: newTask)
            }))
            self.present(alert, animated: true, completion: nil)
        })
        
        //
        
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        
        let deleteAlertAction = UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            
            self?.deleteItem(item: item)
        })
        
        editText.addAction(cancelAlertAction)
        editText.addAction(deleteAlertAction)
        editText.addAction(editAlertAction)
        
        present(editText, animated: true, completion: nil)
        
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let item = self.models[indexPath.row]
            self.deleteItem(item: item)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    // MARK: - Add Button Function
    @objc public func addButtonTapped() {
        
        let todoAlert = UIAlertController(title: "CREATE ITEM", message: "Type Your New Todo Item", preferredStyle: .alert)
        
        todoAlert.addTextField(configurationHandler: nil)
        
        let alertAction = UIAlertAction(title: "Save Item", style: .cancel, handler: { [weak self] _ in
            
            guard let textfield = todoAlert.textFields?.first, let todoText = textfield.text, !todoText.isEmpty else { return }
            
            self?.createItem(name: todoText)
        })
        
        todoAlert.addAction(alertAction)
        
        present(todoAlert, animated: true, completion: nil)
    }
    
    
    // MARK: - Core Data
    func getAllItems() {
        do {
            models = try context.fetch(TodoListItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch {
            //
        }
    }
    
    func createItem(name: String) {
        
        let newItem = TodoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            //
        }
        
    }
    
    func deleteItem(item: TodoListItem) {
        
        context.delete(item)
        do {
            try context.save()
            getAllItems()
        }
        catch {
            //
        }
        
    }
    
    func updateItem(item: TodoListItem, newName: String) {
        
        item.name = newName
        do {
            try context.save()
            getAllItems()
        }
        catch {
            //
        }
        
    }
}

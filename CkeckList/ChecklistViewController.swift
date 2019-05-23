//
//  ViewController.swift
//  CkeckList
//
//  Created by Myo Set Paing on 5/22/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit

class ChecklistViewController:  UITableViewController {
    var todoList: Todolist
    
    required init?(coder aDecoder: NSCoder) {
        todoList = Todolist()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let item = todoList.todos[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = todoList.todos[indexPath.row]
            configureCheckMark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    func configureText(for cell: UITableViewCell,with item: ChecklistItem) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
    func configureCheckMark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .none
        }else{
            cell.accessoryType = .checkmark
        }
        item.toggleCheck()
    }
}


//
//  Todolist.swift
//  CkeckList
//
//  Created by Myo Set Paing on 5/22/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import Foundation

class Todolist {
    var todos: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design"
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
        
    }
    func  newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        todos.append(item)
        return item 
    }
    private func randomTitle() -> String{
        var title = ["New todo item","Generic todo","Fill me out","I need Something todo","Much todo about nothing"]
        let randomNumber = Int.random(in: 0...title.count - 1)
        return title[randomNumber]
    }
}

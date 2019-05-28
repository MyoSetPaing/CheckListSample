//
//  AddItemTableViewController.swift
//  CkeckList
//
//  Created by Myo Set Paing on 5/23/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit
protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailV)
    func itemDetailViewController(_ controller: ItemDetailV, didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailV, didFinishEditing item: ChecklistItem)
}
class ItemDetailV: UITableViewController {

    weak var delegate: ItemDetailViewControllerDelegate?
    weak var todoList: Todolist?
    weak var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBAction func cancel(_ sender: Any) {
        delegate?.itemDetailViewControllerDidCancel(self)

    }
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit , let text = textField.text{
            item.text = text
            delegate?.itemDetailViewController(self, didFinishEditing: item)
            
        }else{
            if let item = todoList?.newTodo(){
                if let textFieldText = textField.text {
                    item.text = textFieldText
                }
                item.checked = false
                delegate?.itemDetailViewController(self, didFinishAdding: item )
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit item"
            textField.text = item.text
            addBarButton.isEnabled = true
        }
        navigationItem.largeTitleDisplayMode = .never
        textField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    

}
extension ItemDetailV: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textField.text ,let stringRange = Range(range,in : oldText) else{
            return false
        }
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        }else{
            addBarButton.isEnabled = true
        }
        return true
    }
}


//
//  ListViewController.swift
//  MilesToGo
//
//  Created by Jasmee Sengupta on 23/03/18.
//  Copyright © 2018 Jasmee Sengupta. All rights reserved.
//1. reorder - how not to show reorder control
//2. delete
//3. show details
//4. here accessory or image
//reorder https://www.ralfebert.de/ios-examples/uikit/uitableviewcontroller/reorderable-cells/

import UIKit

class ListViewController: ViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView! // is this required?
    var toDoList = ["Home", "Office", "Arts"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    // MARK: UITableView DataSource delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") else { return UITableViewCell() }
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    // Reorder rows
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // take care of underlying data source
        let movedObject = toDoList[sourceIndexPath.row]
        toDoList.remove(at: sourceIndexPath.row)
        toDoList.insert(movedObject, at: destinationIndexPath.row)
        print(toDoList)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete // since isEditing = true, delete button shows up. delete, insert, none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false // since isEditing = true, list indented to right make space for delete button
    }
    
    // Edit rows
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        return true
//    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(toDoList)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Erase"
    }

}

//
//  ViewController.swift
//  ToDoList-Demo
//
//  Created by Matthew Krager on 10/30/18.
//  Copyright © 2018 Matthew Krager. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet var table: UITableView!
    
    // An array of items representing our table's data
    // An item at index 0 represents item being shown at row 0 of the table (the first row)
    var items = [Item]()
    
    // Initialization code
    override func viewDidLoad() {
        super.viewDidLoad()
        // makes the top bar look better! (don't worry about this)
        let navigationBar = navigationController!.navigationBar
        navigationBar.shadowImage = UIImage()

        self.table.delegate = self
        self.table.dataSource = self
    }
    
    // Ran when users saves their new Item
    func makeNewItem(name: String) {
        let item = Item(name: name)
        self.items.append(item)
        self.table.reloadData()
    }
    
    // HANDLE USER INTERACTION: Nothing to do here!
    // Prompts the user to add a new item to the To Do List
    @IBAction func promptUserToAddItem() {
        let alertController = UIAlertController(title: "Add an Item", message: "", preferredStyle: .alert)
        // add text field to alert we will show the user
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "e.g. Walk the dog"
        })
        
        // Save and cancel actions for this alert
        let saveAction = UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
            // This code runs when the user hits save
            // Grabs the textfields from the Alert and makes a new item
            // from it
            let itemTextField = alertController.textFields![0] as UITextField
            self.makeNewItem(name: itemTextField.text!)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { // Do nothing on cancel
            (action : UIAlertAction!) -> Void in })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        // Show the user this alert
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Ran by the table when it needs to know how many rows to have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODONE: Replace this with the number of expected rows
        return self.items.count
    }
    
    // Ran by the table when it needs a cell for a given row (indexPath)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // grab the specific item this row is for
        let row = indexPath.row
        let item = self.items[row]
        
        // make a cell for the item
        let cell = UITableViewCell()
        // setup some basic appearance
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.init(name: "BradleyHandITCTT-Bold", size: 21.0)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textAlignment = .center
        
        // TODO: Connect the cell's textLabel to our item
        cell.textLabel?.text = item.name
        
        // if item is marked, add in the strike image
        if item.isMarked {
            let imageView = UIImageView(image: UIImage.init(named: "strike"))
           imageView.frame = CGRect(origin: CGPoint(x: (UIScreen.main.bounds.width - 375)/2, y: 12), size: imageView.frame.size)
            cell.addSubview(imageView)
        }

        // return the cell
        return cell
    }
    
    // Ran whenever a row is tapped on
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // get row and item that was selected
        let row = indexPath.row
        let item = self.items[indexPath.row]
        
        item.isMarked = !item.isMarked
        
        // reload to see the updated changes
        self.table.reloadData()
    }
}

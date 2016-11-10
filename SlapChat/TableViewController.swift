//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


// PROTOCOL PRACTICE
//protocol AddMessageProtocol {
//    
//    func addMessage(_ message: String)
//
//}

class TableViewController: UITableViewController {

// PROTOCOL PRACTICE
//    func addMessage(_ message: String) {
//        contentsofTableView.append(message)
//        tableView.reloadData()
//    }
//    
//    var messagesToDisplayInTableView: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataStore.sharedInstance.fetchData()
        
        //createTestData()
        
        //DataStore.sharedInstance.fetchData()

        print(DataStore.sharedInstance.messages)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func createTestData() {
        
        
        let context = DataStore.sharedInstance.persistentContainer.viewContext
        
        let entityOne = Message(context: context)
        
        entityOne.content = "Remember this day. Tell your children about it. Before the black cloud."
        
        DataStore.sharedInstance.saveContext()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.sharedInstance.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell")
        
        let index = indexPath.row
        
        let textMessage = DataStore.sharedInstance.messages[index].content
        
        cell?.textLabel?.text = textMessage
        
        return cell!
        
    }
    
// PROTOCOL PRACTICE
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destVC = segue.destination as! AddMessageViewController
//        
//        destVC.delegate = self
//    }
    
    
}

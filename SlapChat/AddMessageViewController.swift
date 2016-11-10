//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Douglas Galante on 11/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


class AddMessageViewController: UIViewController {
    
//    var delegate: AddMessageProtocol?
    
    let store = DataStore.sharedInstance
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveText(_ sender: UIButton) {
        
        let text = textField.text!
        
        let managedContext = store.persistentContainer.viewContext
        
        let message = Message(context: managedContext)
        
        let emoji = Emoji(context: managedContext)
        emoji.attribute = "emoji 11"
        let emoji2 = Emoji(context: managedContext)
        emoji2.attribute = "emoje 22"
        
        message.addToEmojis(emoji)
        message.addToEmojis(emoji2)
        
                //entity.content = text
        
        store.saveContext()
        
        let emojisArray = message.emojis?.allObjects as! [Emoji]
        
        for emj in emojisArray {
            print(emj.attribute!)
        }

        
        store.fetchData()
        
        self.dismiss(animated: true, completion: nil)
        
        
// PROTOCOL PRACTICE
//        delegate?.addMessage(textField.text!)
//        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



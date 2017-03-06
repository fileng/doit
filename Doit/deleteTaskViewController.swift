//
//  deleteTaskViewController.swift
//  Doit
//
//  Created by Filip Engström on 2017-03-06.
//  Copyright © 2017 Filip Engström. All rights reserved.
//

import UIKit

class deleteTaskViewController: UIViewController {
    
    var task : Task? = nil

    @IBOutlet weak var taskLabel: UILabel!
    
    @IBAction func deleteTaskButton(_ sender: Any) {
        
        // Get Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Delete task in Core Data
        context.delete(task!)
        
        // Save deletion
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Get back to table view
        navigationController!.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Show selected task
        if task!.important {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

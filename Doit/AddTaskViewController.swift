//
//  AddTaskViewController.swift
//  Doit
//
//  Created by Filip Engström on 2017-03-03.
//  Copyright © 2017 Filip Engström. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        //Create a task
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

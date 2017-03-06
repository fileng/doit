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
    
    var previousVC = ViewController()
    
    @IBAction func addButton(_ sender: Any) {
        //Create a task
        
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        //Add new task to array
        
        previousVC.tasks.append(task)
        
        print(previousVC.tasks.count)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(previousVC.tasks.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

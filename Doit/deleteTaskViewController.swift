//
//  deleteTaskViewController.swift
//  Doit
//
//  Created by Filip Engström on 2017-03-06.
//  Copyright © 2017 Filip Engström. All rights reserved.
//

import UIKit

class deleteTaskViewController: UIViewController {
    
    var task = Task()
    var previousVC = ViewController()

    @IBOutlet weak var taskLabel: UILabel!
    
    
    @IBAction func deleteTaskButton(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

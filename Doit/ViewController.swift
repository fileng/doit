//
//  ViewController.swift
//  Doit
//
//  Created by Filip Engström on 2017-03-02.
//  Copyright © 2017 Filip Engström. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Table View
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Every time view appear
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButton(_ sender: Any) {
        
        // Show addTaskViewController
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "deleteSegue" {
            
            // Show deleteTaskViewController
            let nextVC = segue.destination as! deleteTaskViewController
            
            // Sending task to next view
            nextVC.task = sender as? Task
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Selecting task
        let task = tasks[indexPath.row]
        
        // Perform Segue
        performSegue(withIdentifier: "deleteSegue", sender: task)
    }

    // Get tasks from Core Data
    func getTasks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("Oops we have an error!")
        }
        
    }
}


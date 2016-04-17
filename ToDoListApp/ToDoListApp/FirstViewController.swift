//
//  FirstViewController.swift
//  ToDoListApp
//
//  Created by Joseph Hernandez on 4/16/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

var toDoList = Array<String>()

class FirstViewController: UIViewController,UITableViewDelegate {

    @IBOutlet var todoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        todoListTable.reloadData()
    }

}


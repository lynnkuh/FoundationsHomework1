//
//  RosterTableViewController.swift
//  IOSFoundationHomework3
//
//  Created by Regular User on 9/29/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class RosterTableViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    let names = [Person(fName: "Fred", lName: "Flintstone"),
    Person(fName: "Betty", lName: "Rubble"),
    Person(fName: "Barney", lName: "Rubble"),
    Person(fName: "Wilma", lName: "Flintstone"),
    Person(fName: "Dino", lName: "Flintstone")]
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return names.count
    }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
            
     
       let cell = tableView.dequeueReusableCellWithIdentifier("RosterCell", forIndexPath:indexPath )
            
       let name = names[indexPath.row]
            
       cell.textLabel?.text = "\(name.firstName) \(name.lastName)"
         
             
       cell.backgroundColor = UIColor.whiteColor()
            
            if indexPath.row == 0 {
                cell.backgroundColor = UIColor.yellowColor()
            }
        
            
       return cell
            
    }
    

}

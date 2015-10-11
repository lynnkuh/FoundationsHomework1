//
//  PersonViewController.swift
//  iOSFoundationsHomework7
//
//  Created by Regular User on 10/8/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UITableViewDataSource{
    
    
    @IBOutlet weak var personTableView: UITableView!
 
    
    
    var people = [Person]()
    
    
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        
        personTableView.dataSource = self
        
        let fred = Person(fName: "Fred", lName: "Flintstone")
        let betty = Person(fName: "Betty", lName: "Rubble")
        let barney = Person(fName: "Barney", lName: "Rubble")
        let wilma = Person(fName: "Wilma", lName: "Flintstone")
        let dino = Person(fName: "Dino", lName: "Flintstone")
        
        people.append(fred)
        people.append(betty)
        people.append(barney)
        people.append(wilma)
        people.append(dino)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        personTableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("segue fired")
        if segue.identifier == "ShowPersonDetail" {

            
        if let personDetailViewController = segue.destinationViewController as? PersonDetailViewController {
            
            if let selectedIndexPath = personTableView.indexPathForSelectedRow {
                let selectedRow = selectedIndexPath.row
                
                
//                  let selectedName = names[selectedRow]
                  let chosenPerson = people[selectedRow]
                
                  personDetailViewController.selectedPerson = chosenPerson
                
                
 //               personDetailViewController.firstNameText = selectedName.firstName
 //               personDetailViewController.lastNameText = selectedName.lastName
                
                
                
                personDetailViewController.view.backgroundColor = UIColor.greenColor()
                
                
                
            }
            
        }
        
        } else if segue.identifier == "MyOtherSeque" {
            //this code would customize based on going to a different view controller
        }
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return names.count
          return people.count
    }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
            NSIndexPath) -> UITableViewCell {
                
                
                let cell = personTableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath:indexPath )
                
 //               let name = names[indexPath.row]
                  let person = people[indexPath.row]
                
//                cell.textLabel?.text = "\(name.firstName) \(name.lastName)"
                cell.textLabel?.text = person.firstName + " " + person.lastName
                
                cell.backgroundColor = UIColor.whiteColor()
                
                if indexPath.row == 0 {
                    cell.backgroundColor = UIColor.yellowColor()
                }
                
    
    
    
                return cell
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

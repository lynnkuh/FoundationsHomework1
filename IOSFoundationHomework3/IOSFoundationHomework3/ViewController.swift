//
//  ViewController.swift
//  IOSFoundationHomework3
//
//  Created by Regular User on 9/28/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array1 = [0, 1, 2, 3, 4, 5]
    var array2 = [100, 101, 102, 103, 104, 105]
    var counter = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBOutlet weak var ArrayLabel1: UILabel!
    
  
    @IBAction func ArrayButton1Pressed(sender: AnyObject) {
        let temp = array1[counter]
        let lastValue = array1.last
        ArrayLabel1.text = "\(temp)"
        
        
        counter++
        
        if  temp == lastValue {
            counter = 0
        }
    }
    
    
    @IBOutlet weak var ArrayLabel2: UILabel!
    
    @IBAction func ArrayButton2Pressed(sender: AnyObject) {
        
        let temp = array2[counter]
        let lastValue = array2.last
        ArrayLabel2.text = "\(temp)"
        
        
        counter++
        
        if  temp == lastValue {
            counter = 0
        }
        
        
    }

}
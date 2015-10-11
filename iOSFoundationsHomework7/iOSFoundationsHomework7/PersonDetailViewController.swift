//
//  PersonDetailViewController.swift
//  iOSFoundationsHomework7
//
//  Created by Regular User on 10/8/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    

    var selectedName = "None"
    var selectedPerson: Person!
//    var firstNameText = "None"
 //   var lastNameText = "None"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        firstNameTextField.text = selectedPerson.firstName
        lastNameTextField.text = selectedPerson.lastName
        
        let fredImage = UIImage(named: "fred_flintstone.png")
        imageView.image = fredImage
        
        let wilmaImage = UIImage(named: "wilma_flintstone.jpg")
        imageView.image = wilmaImage
        
        let dinoImage = UIImage(named: "dino_flintstone.jpg")
        imageView.image = dinoImage
        
        let barneyImage = UIImage(named: "barney_rubble.jpg")
        imageView.image = barneyImage
        
        let bettyImage = UIImage(named: "betty_ruble.jpg")
        imageView.image = bettyImage
        
        
        
        
        


        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    
        if let firstNameText = firstNameTextField.text {
            selectedPerson.firstName = firstNameText
        }
        
        if let lastNameText = lastNameTextField.text {
            selectedPerson.lastName = lastNameText
        }
        
        textField.resignFirstResponder()
        return true
        
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

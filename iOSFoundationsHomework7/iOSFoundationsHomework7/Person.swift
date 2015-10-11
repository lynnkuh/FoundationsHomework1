//
//  Person.swift
//  iOSFoundationsHomework7
//
//  Created by Regular User on 10/8/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var firstName: String
    var lastName: String
    var image : UIImage?
    
    init (fName: String, lName: String){
        firstName = fName
        lastName = lName
     
    }
}

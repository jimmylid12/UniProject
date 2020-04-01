//
//  CustomerViewController.swift
//  UniProject
//
//  Created by James Liddle on 26/03/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

class CustomerViewController: UIViewController
{

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var postcode: UITextField!
    @IBOutlet weak var telephonee: UITextField!
     var ref: DatabaseReference!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       ref = Database.database().reference().child("customers");
    }
    

    @IBAction func Upload(_ sender: Any)
    {
        
        add()
      
        
         NSLog("Uploading...")
    }
    
    func add() //function which adds the information to the database,adds them under the club within the database
    {
        let product = [
            
            "Name": Name.text! as String,
            "address": adress.text! as String,
            "postcode": postcode.text! as String,
            "telephone": telephonee.text! as String
            
        ]
        
        ref.childByAutoId().setValue(product)
        
        ref.observe(.value, with: {snapshot in})
        
    
    
    

}
}

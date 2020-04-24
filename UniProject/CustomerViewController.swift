//
//  CustomerViewController.swift
//  UniProject
//
//  Created by James Liddle on 26/03/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
//uploads customer to tableview

class CustomerViewController: UIViewController
{

    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var postcode: UITextField!
    @IBOutlet weak var telephonee: UITextField!
     var ref: DatabaseReference!
     var customer = "customer"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       ref = Database.database().reference().child("customers");
        
        let borderColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        Name.layer.borderWidth = 1
        adress.layer.borderWidth = 1
        postcode.layer.borderWidth = 1
        telephonee.layer.borderWidth = 1
         Name.layer.borderColor = borderColor.cgColor
         adress.layer.borderColor = borderColor.cgColor
         postcode.layer.borderColor = borderColor.cgColor
         telephonee.layer.borderColor = borderColor.cgColor
          Name.layer.cornerRadius = 5.0
         adress.layer.cornerRadius = 5.0
         postcode.layer.cornerRadius = 5.0
         telephonee.layer.cornerRadius = 5.0
        
        
    }
    

    @IBAction func Upload(_ sender: Any)
    {
        
        add()
      
        
         NSLog("Uploading...")
    }
    
    func add() //function which adds the information to the database,adds them under the club within the database
    {
        let key = ref.childByAutoId().key
        
        let product = [
            
            
            "id":key,
            "Name": Name.text! as String,
            "Address": adress.text! as String,
            "Postcode": postcode.text! as String,
            "Telephone": telephonee.text! as String
            
        ]
        
        ref.childByAutoId().setValue(product)
        
        ref.observe(.value, with: {snapshot in})
        
    
    
    

}
}

//
//  customerCreation.swift
//  UniProject
//
//  Created by James Liddle on 09/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class customerCreation: UIViewController
{

    @IBOutlet weak var CustomerName: UITextField!
    @IBOutlet weak var CustomerAddress: UITextField!
    @IBOutlet weak var CustomerPostCode: UITextField!
    @IBOutlet weak var CustomerTelephone: UITextField!
    
          var ref : DatabaseReference!
          var newMedia: Bool?
          var imagePickerController : UIImagePickerController!
          var customer = "customer"
          var downloadURL = "temp"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        guard let userID = Auth.auth().currentUser?.uid else {return}
              ref = Database.database().reference().child("Users").child(userID).child("customers")
              NSLog("customers")
  
    }
    
    func addCustomerInformation()
    {
        let customer = [
                      "CustomerName": CustomerName.text! as String,
                      "CustomerAddress":CustomerAddress.text! as String,
                      "CustomerPostCode": CustomerPostCode.text! as String,
                      "CustomerTelephone": CustomerTelephone.text! as String
        ]

        ref.childByAutoId().setValue(customer)
        
        ref.observe(.value, with: {snapshot in})
        
    }
    
    
    

  
    @IBAction func AddCustomer(_ sender: Any)
    {
        addCustomerInformation() //calls upload image pic which in turn calls add inoformation
                      
                      NSLog("Uploading...")
    }
    
}

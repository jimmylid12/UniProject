//
//  createStaffUser.swift
//  UniProject
//
//  Created by James Liddle on 09/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//Allows the staff to create an account
class createStaffUser: UIViewController
{
    @IBOutlet weak var createStaffUserName: UITextField!
    @IBOutlet weak var createStaffPassword: UITextField!
    var ref : DatabaseReference!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    }
    
    
    
    @IBAction func StaffAccountCreation(_ sender: Any)
    {
        if createStaffUserName.text == ""
        {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else
        {
            Auth.auth().createUser(withEmail: createStaffUserName.text!, password: createStaffPassword.text!) { (user, error) in
                
                
                if error == nil
                {
                    print("You have successfully signed up")
                    let currentUser = Auth.auth().currentUser
                    
                    let user = ["Name": self.createStaffUserName.text! as String]
                    
                    self.ref.child("Users").child(currentUser!.uid).setValue(user)
                    
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "staffhomepage")
                    self.present(vc!, animated: true, completion: nil)
                    
                }
                else
                {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}

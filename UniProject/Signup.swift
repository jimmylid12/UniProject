//
//  Signup.swift
//  UniProject
//
//  Created by James Liddle on 04/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//Allows staff to create an account an login by taking a username and password
class Signup: UIViewController
{
    @IBOutlet weak var signup: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    var ref : DatabaseReference!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    }
    
   @IBAction func SignUp(_ sender: Any)
    {
        
        if signup.text == ""
        {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else
        {
            Auth.auth().createUser(withEmail: signup.text!, password: password.text!) { (user, error) in
                
                
                if error == nil
                {
                    print("You have successfully signed up")
                   
                    let currentUser = Auth.auth().currentUser
                    
//                    let user = ["Name": self.signup.text! as String]
//
//                    self.ref.child("Users").child(currentUser!.uid).setValue(user)
                    
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    
                    
                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
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

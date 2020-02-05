//
//  Login.swift
//  UniProject
//
//  Created by James Liddle on 04/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class Login: UIViewController
{

   
    @IBOutlet weak var userSignIn: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    
    
 
    @IBAction func logiinButton(_ sender: Any)
    {
        if self.userSignIn.text == "" || self.userPassword.text == "" {
         
         //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
         
         let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
         
         let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
         alertController.addAction(defaultAction)
         
         self.present(alertController, animated: true, completion: nil)
     
     }
        else
        {
     
            Auth.auth().signIn(withEmail: self.userSignIn.text!, password: self.userPassword.text!) { (user, error) in
         
         if error == nil {
             
             //Print into the console if successfully logged in
             print("You have successfully logged in")
             
             //Go to the HomeViewController if the login is sucessful
             let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
             self.present(vc!, animated: true, completion: nil)
            
             
         } else {
             
             //Tells the user that there is an error and then gets firebase to tell them the error
             let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
             
             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
             alertController.addAction(defaultAction)
             
             self.present(alertController, animated: true, completion: nil)
             }
         }
    
        
    }
    
  
    }}
  
    
    
    


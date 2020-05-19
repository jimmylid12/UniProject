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

//Allows staff to create an account and login by inputting a username and password
class signup: UIViewController
{
    @IBOutlet weak var signup: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    var ref : DatabaseReference!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference()
        let borderColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        password.layer.borderWidth = 1
        signup.layer.borderWidth = 1
        password.layer.borderColor = borderColor.cgColor
        signup.layer.borderColor = borderColor.cgColor
        password.layer.cornerRadius = 5.0
        signup.layer.cornerRadius = 5.0
        
        
        
        
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

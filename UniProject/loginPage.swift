//
//  LoginPage.swift
//  UniProject
//
//  Created by James Liddle on 05/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//Allows the staff  to login into the application using the credentials from the sign up page.
class loginPage: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let borderColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        passwordTextField.layer.borderWidth = 1
        emailTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = borderColor.cgColor
        emailTextField.layer.borderColor = borderColor.cgColor
        passwordTextField.layer.cornerRadius = 5.0
        emailTextField.layer.cornerRadius = 5.0
        passwordTextField.delegate = self;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func loginAction(_ sender: Any)
    {
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            //displays error message if there is any issue logging in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //shows in the console if loggin is successful
                    print("You have successfully logged in")
                    
                    //Goes to the homepage if login is successful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //displays error if incorrect
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

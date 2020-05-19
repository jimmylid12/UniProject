//
//  StaffLogin.swift
//  UniProject
//
//  Created by James Liddle on 06/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//login page for admin staff
class staffAdminLogin: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var staffUserName: UITextField!
    @IBOutlet weak var staffPassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       staffPassword.delegate = self;
       }
       
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
           }
    

    @IBAction func staffSignIn(_ sender: Any)
    {
        if self.staffUserName.text == "" || self.staffPassword.text == ""
        {
                      
                     
                      
                      let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
                      
                      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                      alertController.addAction(defaultAction)
                      
                      self.present(alertController, animated: true, completion: nil)
                  
                  }
        else {
                      
                    Auth.auth().signIn(withEmail: self.staffUserName.text!, password: self.staffPassword.text!) { (user, error) in
                          
                          if error == nil {
                              
                           
                              print("You have successfully logged in")
                              
                            
                              let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                              self.present(vc!, animated: true, completion: nil)
                              
                          } else {
                              
                             
                              let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                              
                              let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                              alertController.addAction(defaultAction)
                              
                              self.present(alertController, animated: true, completion: nil)
                          }
                      }
            
        
        
        
    }
   

}
}

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


class StaffLogin: UIViewController
{

    @IBOutlet weak var staffUserName: UITextField!
    @IBOutlet weak var staffPassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
    }
    

    @IBAction func staffSignIn(_ sender: Any)
    {
        if self.staffUserName.text == "" || self.staffPassword.text == ""
        {
                      
                      //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
                      
                      let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
                      
                      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                      alertController.addAction(defaultAction)
                      
                      self.present(alertController, animated: true, completion: nil)
                  
                  }
        else {
                      
                    Auth.auth().signIn(withEmail: self.staffUserName.text!, password: self.staffPassword.text!) { (user, error) in
                          
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
   

}
}

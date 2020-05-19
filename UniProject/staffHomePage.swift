//
//  staffHomePage.swift
//  UniProject
//
//  Created by James Liddle on 09/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//staff homepage with links to edit the customer orders and logout
class staffHomePage: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func LogoutStaff(_ sender: Any)
    {
        
        if Auth.auth().currentUser != nil
        {
            do
            {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "stafflogin")
                print("You have successfully logged out")
                
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError
            {
                print(error.localizedDescription)
               
                
            }
            
        }
    }
}



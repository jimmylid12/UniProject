//
//  HomePage.swift
//  UniProject
//
//  Created by James Liddle on 04/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//HomePage for the applicaton, allows staff member to create an order or logout
class homePage: UIViewController
{
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var viewC: UIButton!
    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var logout: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    
    }
    
    
    //simple function which logs the user out of the application and takes you to the login screen
    @IBAction func logout(_ sender: Any)
    {
        
        if Auth.auth().currentUser != nil
        {
            do
            {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login")
                print("You have successfully logged out")
                
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError
            {
                print(error.localizedDescription)
                print ("error")
                
            }
            
        }
    }
    
    
    
    
}

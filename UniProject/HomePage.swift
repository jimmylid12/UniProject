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

class HomePage: UIViewController
{

   
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

      
       
        
    }
    
    

    @IBAction func logout(_ sender: Any)
    {
        
        if Auth.auth().currentUser != nil
        {
            do
            {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login")
                
                
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError
            {
                print(error.localizedDescription)
                print ("test")
                
            }
            
        }
    }
    
}

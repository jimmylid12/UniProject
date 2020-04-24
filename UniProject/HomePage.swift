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

//HomePage for the applicaton, allows a user to create an order or logout
class HomePage: UIViewController
{
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var add: UIButton!
     @IBOutlet weak var viewC: UIButton!
    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var logout: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()

//      search.backgroundColor = .black
//      search.layer.cornerRadius = 5
//      search.layer.borderWidth = 1
//      search.layer.borderColor = UIColor.black.cgColor
//
//        add.backgroundColor = .black
//             add.layer.cornerRadius = 5
//            add.layer.borderWidth = 1
//             add.layer.borderColor = UIColor.black.cgColor
//
//       viewC.backgroundColor = .black
//        viewC.layer.cornerRadius = 5
//        viewC.layer.borderWidth = 1
//        viewC.layer.borderColor = UIColor.black.cgColor
//
//        edit.backgroundColor = .black
//        edit.layer.cornerRadius = 5
//        edit.layer.borderWidth = 1
//        edit.layer.borderColor = UIColor.black.cgColor
//
//        logout.backgroundColor = .black
//              logout.layer.cornerRadius = 5
//               logout.layer.borderWidth = 1
//              logout.layer.borderColor = UIColor.black.cgColor
//
    }
    
    

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

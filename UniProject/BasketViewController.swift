//
//  BasketViewController.swift
//  UniProject
//
//  Created by James Liddle on 23/04/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



class BasketViewController: UIViewController, UINavigationControllerDelegate
{
   
    
    @IBOutlet weak var label: UILabel!
    
    var list = [CustomerModel].self
   
    var textt: String = "" 
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
    label.text = self.textt
    }
    

    
    
}

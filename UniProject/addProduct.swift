//
//  addProduct.swift
//  UniProject
//
//  Created by James Liddle on 09/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//This is what allows the admin team to add a product to the datbase
class addProduct: UIViewController {
    
    
    
    @IBOutlet weak var pName: UITextField!
    @IBOutlet weak var pNumber: UITextField!
    @IBOutlet weak var pPrice: UITextField!
    @IBOutlet weak var pInfo: UITextField!
    
    //    var List = [Model]()
    var ref : DatabaseReference!
    
    
    
    
    
    func addInformation()
    {
        let product = [
            "ProductName": pName.text! as String,
            "ProductNumber":pNumber.text! as String,
            "productPrice": pPrice.text! as String,
            "productInfo": pInfo.text! as String
        ]
        
        ref.childByAutoId().setValue(product)
        
        ref.observe(.value, with: {snapshot in})
        
    }
    
    
    @IBAction func uploading(_ sender: Any)
    {
        
        addInformation() //calls upload image pic which in turn calls add inoformation
        
        NSLog("Uploading...")
        
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("products")
        NSLog("products")
        
        
        
        
        
        
    }
}

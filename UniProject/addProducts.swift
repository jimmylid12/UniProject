//
//  addProducts.swift
//  UniProject
//
//  Created by James Liddle on 09/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import MobileCoreServices

class addProducts: UIViewController
{

    @IBOutlet weak var productNumber: UITextField!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var Information: UITextField!
    //var List = [Model]()
       var ref : DatabaseReference!
       var newMedia: Bool?
       var imagePickerController : UIImagePickerController!
       var product = "product"
       var downloadURL = "temp"
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    func addInformation() //function which adds the information to the database,adds them under the club within the database
    {
        let product = [
                      "productNumber": productNumber.text! as String,
                      "productName": productNumber.text! as String,
                      "price": price.text! as String,
                      "Information": Information.text! as String,
                      
        ]

        ref.childByAutoId().setValue(product)
        
        ref.observe(.value, with: {snapshot in})
        
    }
    
    
    //The upload function is what adds it to firebase
    @IBAction func upload(_ sender: Any)
    
    {
       

    }
    
    
    
    
   
    @IBAction func addtodatabase(_ sender: Any)
    {
        
                addInformation() //calls upload image pic which in turn calls add inoformation
               
               NSLog("Uploading...")
    }
    
}

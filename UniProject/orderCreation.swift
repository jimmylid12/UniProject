//
//  CustomerViewController.swift
//  UniProject
//
//  Created by James Liddle on 26/03/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
//uploads order to database

class orderCreation: UIViewController
{
    @IBOutlet weak var product: UITextField!
    @IBOutlet weak var productprice: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var postcode: UITextField!
    @IBOutlet weak var telephonee: UITextField!
    @IBOutlet weak var deliveryDate: UITextField!
    @IBOutlet weak var collectordeliver: UITextField!
    var ref: DatabaseReference!
    var customer = "customer"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference().child("Orders");
        
        let borderColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        name.layer.borderWidth = 3
        adress.layer.borderWidth = 3
        postcode.layer.borderWidth = 3
        telephonee.layer.borderWidth = 3
        name.layer.borderColor = borderColor.cgColor
        adress.layer.borderColor = borderColor.cgColor
        postcode.layer.borderColor = borderColor.cgColor
        telephonee.layer.borderColor = borderColor.cgColor
        name.layer.cornerRadius = 5.0
        adress.layer.cornerRadius = 5.0
        postcode.layer.cornerRadius = 5.0
        telephonee.layer.cornerRadius = 5.0
        product.layer.borderWidth = 3
        product.layer.borderColor = borderColor.cgColor
        product.layer.cornerRadius = 5.0
        productprice.layer.borderWidth = 3
        productprice.layer.borderColor = borderColor.cgColor
        productprice.layer.cornerRadius = 5.0
        deliveryDate.layer.borderWidth = 3
        deliveryDate.layer.borderColor = borderColor.cgColor
        deliveryDate.layer.cornerRadius = 5.0
        collectordeliver.layer.borderWidth = 3
        collectordeliver.layer.borderColor = borderColor.cgColor
        collectordeliver.layer.cornerRadius = 5.0

        
    }
    
    
    @IBAction func Upload(_ sender: Any)
    {
        
        add()
        NSLog("Uploading...")
    }
    
    func add() //function which adds the order information to the database,adds them under  Orders within the database
    {
        let key = ref.childByAutoId().key
        
        let order = [
            
            "id":key,
            "Name": name.text! as String,
            "Address": adress.text! as String,
            "Postcode": postcode.text! as String,
            "Telephone": telephonee.text! as String,
            "Product": product.text! as String,
            "Price": productprice.text! as String,
            "DeliveryDate": deliveryDate.text! as String,
            "CollectionOrDelivery": collectordeliver.text! as String,
            
        ]
        
        ref.childByAutoId().setValue(order)
        
        ref.observe(.value, with: {snapshot in})
        
        
        
        
        
    }
    
    
    
}

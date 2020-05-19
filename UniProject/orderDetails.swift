//
//  testViewController.swift
//  UniProject
//
//  Created by James Liddle on 03/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

//Page which displays all of the firebase information, once user clicks on tableviewcell
class orderDetails: UIViewController {
    
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerAddress: UILabel!
    @IBOutlet weak var customerPostcode: UILabel!
    @IBOutlet weak var customerTelephone: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var deliveryDate: UILabel!
    @IBOutlet weak var collectionDelivery: UILabel!
    
    var ref : DatabaseReference!
    
    var nameString: String!
    var addressString: String!
    var postCodeString: String!
    var telephoneString: String!
    var pNameString: String!
    var pPriceString: String!
    var deliveryDateString: String!
    var collectionDeliveryString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("Orders");
        self.customerName.text = self.nameString
        self.customerAddress.text = self.addressString
        self.customerPostcode.text = self.postCodeString
        self.customerTelephone.text = self.telephoneString
        self.productName.text = self.pNameString
        self.productPrice.text = self.pPriceString
        self.deliveryDate.text = self.deliveryDateString
        self.collectionDelivery.text = self.collectionDeliveryString
        
    }
    
    
    
    
    
    
    //Sends user back to previous page
    @IBAction func Back(_ sender: Any)
    {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "customerView")
        present(vc, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
}

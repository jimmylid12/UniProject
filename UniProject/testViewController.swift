//
//  testViewController.swift
//  UniProject
//
//  Created by James Liddle on 03/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

class testViewController: UIViewController {
    
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerAddress: UILabel!
    @IBOutlet weak var customerPostcode: UILabel!
    @IBOutlet weak var customerTelephone: UILabel!
    
   
    var nameString: String!
    var addressString: String!
    var postCodeString: String!
    var telephoneString: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customerName.text = self.nameString
        self.customerAddress.text = self.addressString
        self.customerPostcode.text = self.postCodeString
         self.customerTelephone.text = self.telephoneString
    }
    
    
    
    
    
    
    
    
}

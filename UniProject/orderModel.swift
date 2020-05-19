//
//  CustomerModel.swift
//  UniProject
//
//  Created by James Liddle on 11/04/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

//This is needed in order for data to be called back from the database
class orderModel
{
    var id: String?
    var name: String?
    var address: String?
    var postcode: String?
    var telephone: String?
    var productname: String?
    var productprice: String?
    var deliveryDate: String?
    var collecitondelivery: String?
    
    init(id: String?,name: String?, address: String?, postcode: String?, telephone:String?,productname:String?,productprice:String?,deliveryDate: String?,collectiondelivery: String?)
    {
        self.id = id
        self.name = name
        self.address = address
        self.postcode = postcode
        self.telephone = telephone
        self.productname = productname
        self.productprice = productprice
        self.deliveryDate = deliveryDate
        self.collecitondelivery = collectiondelivery
        
    }
    
    
    
    
    
    
    
    
}




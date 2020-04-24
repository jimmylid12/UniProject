//
//  CustomerModel.swift
//  UniProject
//
//  Created by James Liddle on 11/04/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit


class CustomerModel
{
    var id: String?
    var name: String?
    
    var address: String?
    var postcode: String?
    var telephone: String?
    
    init(id: String?,name: String?, address: String?, postcode: String?, telephone:String?)
    {
        self.id = id
        self.name = name
        self.address = address
        self.postcode = postcode
        self.telephone = telephone
        
        
        
    }
    
    
    
    
}




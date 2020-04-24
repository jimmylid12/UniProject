//
//  Model.swift
//  UniProject
//
//  Created by James Liddle on 20/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

class Model{
    
    
    var id: String?
    var name: String?
    var number: String?
    var prices: String?
    var info: String?
    
    init(id: String?,name: String?, number: String?, prices: String?, info:String?)
    {
        self.id = id
        self.name = name
        self.number = number
        self.prices = prices
        self.info = info
        
        
    }
    


}

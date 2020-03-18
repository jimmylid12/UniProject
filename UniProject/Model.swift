//
//  Model.swift
//  UniProject
//
//  Created by James Liddle on 20/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

class Model{
    
    
    var name: String?
    var number: String?
    var prices: String?
    var info: String?
    
    init(name: String?, number: String?, prices: String?, info:String?)
    {
        
        self.name = name
        self.number = number
        self.prices = prices
        self.info = info
        
        
    }
}

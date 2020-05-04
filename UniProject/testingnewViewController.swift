//
//  testingnewViewController.swift
//  UniProject
//
//  Created by James Liddle on 03/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

class testingnewViewController: UIViewController {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productNumber: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productInfo: UILabel!
    var nameString: String!
    var  numberString: String!
    var  priceString: String!
    var  infoString: String!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.productName.text = self.nameString
        self.productNumber.text = self.numberString
        self.productPrice.text = self.priceString
        self.productInfo.text = self.infoString
    }
    
    
    
    
    
    
    
    
    
}

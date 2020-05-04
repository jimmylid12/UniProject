//
//  finalViewController.swift
//  UniProject
//
//  Created by James Liddle on 04/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

class finalViewController: UIViewController {

    @IBOutlet weak var finalcustomerName: UILabel!
    
    @IBOutlet weak var finalProductName: UILabel!
    
   var finalproductString: String!
    var finalcustomerString: String!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.finalcustomerName.text = self.finalcustomerString
        self.finalProductName.text = self.finalproductString
      
    }
    
  

}

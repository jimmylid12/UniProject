//
//  productTableViewCell.swift
//  UniProject
//
//  Created by James Liddle on 02/04/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//


import UIKit

//this adds the stepper in order to add a product to the basket
class productTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    
   
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.label.text = "0"
    }
    @IBAction func stepperbutton(_ sender: UIStepper)
    {
         label.text = Int(sender.value).description
         
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
 
}
   
   
    
    
    
   
    


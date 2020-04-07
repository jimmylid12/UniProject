//
//  productTableViewCell.swift
//  UniProject
//
//  Created by James Liddle on 02/04/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//


import UIKit

class productTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
  
   
    @IBAction func chg(_ sender: UIStepper)
    {
        self.label.text = String((sender as UIStepper).value);
    }
    
    
    
   
    
}

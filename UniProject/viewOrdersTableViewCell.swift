//
//  customersTableViewCell.swift
//  UniProject
//
//  Created by James Liddle on 01/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

//labels which are assigned to the tableview cell to display relevant firebase data
class viewOrdersTableViewCell: UITableViewCell
{
   
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerAddress: UILabel!
  
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
     
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}

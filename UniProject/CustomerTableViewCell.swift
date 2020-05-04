//
//  CustomerTableViewCell.swift
//  UniProject
//
//  Created by James Liddle on 11/04/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

//allows customer information to be displayed in the tableviews,by assinging them to the labels in the tableview
class CustomerTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var labelN: UILabel!
    @IBOutlet weak var labelA: UILabel!
    
    @IBOutlet weak var labelT: UILabel!
    @IBOutlet weak var labelP: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}

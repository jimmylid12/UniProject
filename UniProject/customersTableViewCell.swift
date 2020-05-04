//
//  customersTableViewCell.swift
//  UniProject
//
//  Created by James Liddle on 01/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

class customersTableViewCell: UITableViewCell
{
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var Postcode: UILabel!
    @IBOutlet weak var Telephone: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//
//  TableViewCell.swift
//  UniProject
//
//  Created by James Liddle on 20/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
//Model for classes, this allows the tableview to display information from firebase for the orders

class editOrderTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerAddress: UILabel!
    @IBOutlet weak var customerPostCode: UILabel!
    @IBOutlet weak var customerTelephone: UILabel!
    @IBOutlet weak var deliveryDate: UILabel!
    @IBOutlet weak var collectionOrDelivery: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
}

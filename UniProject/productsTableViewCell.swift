//
//  productsTableViewCell.swift
//  UniProject
//
//  Created by James Liddle on 01/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit

class productsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productNumber: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//
//  productsViewController.swift
//  UniProject
//
//  Created by James Liddle on 01/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

class productsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var productTableview: UITableView!
    
    var list = [Model]()
    var ref: DatabaseReference!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        show()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
        
        
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! productsTableViewCell
        
        
        let product: Model
        
        //getting the artist of selected position
        product = list[indexPath.row]
        
        
        cell.productName.text = product.name
        cell.productNumber.text = product.number
        cell.productInfo.text = product.info
        cell.productPrice.text = product.prices
        
        
        
        
        //returning cell
        return cell
    }
    
    func show()
    {
        super.viewDidLoad()
        productTableview.delegate = self
        productTableview.dataSource = self
        self.productTableview.rowHeight = 150.0
        
        ref = Database.database().reference().child("products");
        
        ref.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.list.removeAll()
                
                //iterating through all the values
                for products in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let productObject = products.value as? [String: AnyObject]
                    let Name = productObject?["Name"]
                    let Number  = productObject?["Number"]
                    let  Price = productObject?["Price"]
                    let ID = productObject?["id"]
                    let Info = productObject?["Info"]
                    
                    //creating artist object with model and fetched values
                    let product = Model(id: ID as! String?,name: Name as! String?, number: Number as! String?, prices: Price as! String?, info: Info as! String?)
                    
                    //appending it to list
                    self.list.append(product)
                }
                
                //reloading the tableview
                self.productTableview.reloadData()
            }
        })
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let upcoming: testingnewViewController = segue.destination as! testingnewViewController
        
        let indexPath = self.productTableview.indexPathForSelectedRow!
        
        let nameString = self.list[indexPath.row].name
        
        let numberString = self.list[indexPath.row].number
        let priceString = self.list[indexPath.row].prices
        let infoString = self.list[indexPath.row].info
        
        
        
        
        upcoming.nameString = nameString
        upcoming.numberString = numberString
        upcoming.priceString = priceString
        upcoming.infoString = infoString
        
        
        self.productTableview.deselectRow(at: indexPath, animated: true)
    }
    
    
}

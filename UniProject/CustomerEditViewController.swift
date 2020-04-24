//
//  CustomerEditViewController.swift
//  UniProject
//
//  Created by James Liddle on 11/04/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Foundation


//tableView which displays the customer information which you can edit and update
// uses the customer var varible from the customer upload view in order for it to be displayed
class CustomerEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate{
   
    @IBOutlet weak var tableView: UITableView!
    var list = [CustomerModel]()
    private var product: [ProductDemo]?
    var ref: DatabaseReference!
    var handle:DatabaseHandle?
    var customer = "customer"
    var searchActive : Bool = false
    
    
   
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
         return 1
         }
         
    
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
        guard let product = product else{return 0}
        return product.count
           
           
       }
    
    
  
       
       public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
           //creating a cell using the custom class
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomerTableViewCell
           
         
               let customer: ProductDemo
               
               //getting the artist of selected position
        customer = product![indexPath.row]
               
        
            cell.labelN.text = customer.name
            cell.labelA.text = customer.address
            cell.labelP.text = customer.postcode
            cell.labelT.text = customer.telephone
       
            
             
               //returning cell
               return cell
           }
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegue(withIdentifier: "clicked", sender: self)
    }
    
 func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
if segue.identifier == "clicked" {
let indexPaths=self.tableView!.indexPathsForSelectedRows!
let indexPath = indexPaths[0] as NSIndexPath
    let vc = segue.destination as! BasketViewController
    guard let product = product else {return }
    vc.textt = product[indexPath.row]
}
}
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
               tableView.dataSource = self
               self.tableView.rowHeight = 150.0
               
               ref = Database.database().reference().child("customers");
               
               ref.observe(DataEventType.value, with: { (snapshot) in
                   
                   //if the reference have some values
                   if snapshot.childrenCount > 0 {
                       
                       //clearing the list
                       self.product.removeAll()
                       
                       //iterating through all the values
                       for customers in snapshot.children.allObjects as! [DataSnapshot] {
                           //getting values
                           let customerObject = customers.value as? [String: AnyObject]
                           let Name = customerObject?["Name"]
                           let Address  = customerObject?["Address"]
                           let Telephone = customerObject?["Telephone"]
                           let ID = customerObject?["id"]
                          let PostCode = customerObject?["Postcode"]
                       
                           
                           //creating artist object with model and fetched values
                        let customer = CustomerModel(id: ID as! String?,name: Name as! String?, address: Address as! String?, postcode: PostCode as! String?, telephone: Telephone as! String?)
                           
                           //appending it to list
                           self.product.append(customer)
                       }
                       
                       //reloading the tableview
                       self.tableView.reloadData()
                   }
               })
           }
    
    
  
   
    
   

        
        
        
        
    
    
}



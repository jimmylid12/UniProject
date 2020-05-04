//
//  orderViewController.swift
//  UniProject
//
//  Created by James Liddle on 01/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

class orderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate
{
    var list = [CustomerModel]()
    var ref: DatabaseReference!
    @IBOutlet weak var customerTableview: UITableView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        show()
        ref = Database.database().reference()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customersTableViewCell
        
        
        let customer: CustomerModel
        
        //getting the artist of selected position
        customer = list[indexPath.row]
        
        
        cell.Name.text = customer.name
        cell.Address.text = customer.address
        cell.Postcode.text = customer.postcode
        cell.Telephone.text = customer.telephone
        
        
        
        //returning cell
        return cell
    }
    
    
    func show()
    {
        
        super.viewDidLoad()
        customerTableview.delegate = self
        customerTableview.dataSource = self
        self.customerTableview.rowHeight = 150.0
        
        ref = Database.database().reference().child("order");
        
        ref.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.list.removeAll()
                
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
                    self.list.append(customer)
                }
                
                //reloading the tableview
                self.customerTableview.reloadData()
            }
        })
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let upcoming: testViewController = segue.destination as! testViewController
      //  let final: finalViewController = segue.destination as! finalViewController
        
        let indexPath = self.customerTableview.indexPathForSelectedRow!
        let nameString = self.list[indexPath.row].name
        let addressString = self.list[indexPath.row].address
        let postCodeString = self.list[indexPath.row].postcode
        let telephoneString = self.list[indexPath.row].telephone
        
   //     let finalproductString = self.list[indexPath.row].name
        
        
        upcoming.nameString = nameString
        upcoming.addressString = addressString
        upcoming.postCodeString = postCodeString
        upcoming.telephoneString = telephoneString
    //    final.finalproductString = finalproductString
        
        self.customerTableview.deselectRow(at: indexPath, animated: true)
    }
}

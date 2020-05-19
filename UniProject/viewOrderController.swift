//
//  orderViewController.swift
//  UniProject
//
//  Created by James Liddle on 01/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

class viewOrderController: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate
{
    var list = [orderModel]()
    var ref: DatabaseReference!
    @IBOutlet weak var orderTableView: UITableView!
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! viewOrdersTableViewCell
        
        
        let customer: orderModel
        
        //getting the order to display within the tableview
        //Not all of the information is displayed as that is in the next viewcontroller
        customer = list[indexPath.row]
        cell.customerName.text = customer.name
        cell.customerAddress.text = customer.address
        cell.productName.text = customer.productname
        cell.productPrice.text = customer.productprice

        
        
        //returns data
        return cell
    }
    
    
    func show()
    {
        
        super.viewDidLoad()
        orderTableView.delegate = self
        orderTableView.dataSource = self
        self.orderTableView.rowHeight = 200.0
        
        ref = Database.database().reference().child("Orders");
        
        ref.observe(DataEventType.value, with: { (snapshot) in
            
         
            if snapshot.childrenCount > 0 {
                
                //this clears and refreshes the list
                self.list.removeAll()
                
               
                for orders in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let orderObject = orders.value as? [String: AnyObject]
                    let Name = orderObject?["Name"]
                    let Address  = orderObject?["Address"]
                    let Telephone = orderObject?["Telephone"]
                    let ID = orderObject?["id"]
                    let PostCode = orderObject?["Postcode"]
                    let Product = orderObject?["Product"]
                    let Price = orderObject?["Price"]
                    let DeliveryDate = orderObject?["DeliveryDate"]
                    let CollectionDelivery = orderObject?["CollectionOrDelivery"]
                    
                    //creating order object with orderModel
                    let order = orderModel(id: ID as! String?,name: Name as! String?, address: Address as! String?, postcode: PostCode as! String?, telephone: Telephone as! String?,productname:  Product as! String?,productprice:Price as! String?,deliveryDate: DeliveryDate as! String?,collectiondelivery:CollectionDelivery as! String?)
                    
                    //appending it to list
                    self.list.append(order)
                }
                
                //reloading the tableview
                self.orderTableView.reloadData()
            }
        })
        
        
    }
    
    //Sends all of the order information to another view controller to be displayed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let upcoming: orderDetails = segue.destination as! orderDetails

        let indexPath = self.orderTableView.indexPathForSelectedRow!
        let nameString = self.list[indexPath.row].name
        let addressString = self.list[indexPath.row].address
        let postCodeString = self.list[indexPath.row].postcode
        let telephoneString = self.list[indexPath.row].telephone
        let pNameString =  self.list[indexPath.row].productname
        let pPriceString =  self.list[indexPath.row].productprice
        let deliveryDateString =  self.list[indexPath.row].deliveryDate
        let collectionDeliveryString =  self.list[indexPath.row].collecitondelivery

        upcoming.nameString = nameString
        upcoming.addressString = addressString
        upcoming.postCodeString = postCodeString
        upcoming.telephoneString = telephoneString
        upcoming.pNameString = pNameString
        upcoming.pPriceString = pPriceString
        upcoming.deliveryDateString = deliveryDateString
        upcoming.collectionDeliveryString = collectionDeliveryString
        
        self.orderTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //sends user back to the home screen
    @IBAction func Back(_ sender: Any)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
        present(vc, animated: true, completion: nil)
    }
    
    
    
}

//
//  productsViewController.swift
//  UniProject
//
//  Created by James Liddle on 11/05/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

//This is what the staff admin use to edit and delete orders
class ordersViewController: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    var list = [orderModel]()
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference()
        show()
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
    
    //displays all of the orders which the staff upload to the database
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! editOrderTableViewCell
        
        let order: orderModel
        
        order = list[indexPath.row]
        
        cell.productPrice.text = order.productprice
        cell.product.text = order.productname
        cell.customerName.text = order.name
        cell.customerAddress.text = order.address
        cell.customerPostCode.text = order.postcode
        cell.customerTelephone.text =  order.telephone
        cell.deliveryDate.text =  order.deliveryDate
        cell.collectionOrDelivery.text = order.collecitondelivery
        
        
        return cell
    }
    
    
    func show()
    {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 200.0
        
        ref = Database.database().reference().child("Orders");
        
        ref.observe(DataEventType.value, with: { (snapshot) in
            
         
            if snapshot.childrenCount > 0 {
                
             
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
                    
                    //creates the order and attaches it to the tableview
                    let order = orderModel(id: ID as! String?,name: Name as! String?, address: Address as! String?, postcode: PostCode as! String?, telephone: Telephone as! String?,productname:  Product as! String?,productprice:Price as! String?,deliveryDate:DeliveryDate as! String?,collectiondelivery: CollectionDelivery as! String? )
                    
                    //appending it to list
                    self.list.append(order)
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
        })
        
        
    }
    
    @IBAction func backButton(_ sender: Any)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "staffhomepage")
        present(vc, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let order  = list[indexPath.row]
        
        let alertController = UIAlertController(title: order.productprice, message: "Update Order ", preferredStyle: .alert)
        
        let backAction = UIAlertAction(title: "Cancel", style: .default) { (_) in }
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            
            let id = order.id
            
            let name  = alertController.textFields?[0].text
            let address  = alertController.textFields?[1].text
            let postcode  = alertController.textFields?[2].text
            let telephone  = alertController.textFields?[3].text
            let product  = alertController.textFields?[4].text
            let price = alertController.textFields?[5].text
            let delivery  = alertController.textFields?[6].text
            let collectionorDelivery  = alertController.textFields?[7].text
            
            //calling the update method to update order and update new values
            self.update(id: id!,name:name!,address:address!,postcode:postcode!,telephone:telephone!,product:product!,price:price!,delivery:delivery!,collectionordelivery:collectionorDelivery!)
        }
        
        
        
       //this deletes the order and removes it from the tableview and database
        let cancelAction = UIAlertAction(title: "Delete", style: .cancel) { (_) in
            //deleting artist
            self.deleteOrder(id: order.id!)
        }
        
        alertController.addTextField { (textField) in
            textField.text = order.name
        }
        
        alertController.addTextField { (textField) in
                   textField.text = order.address
               }
        
        alertController.addTextField { (textField) in
            textField.text = order.postcode
        }
        
        alertController.addTextField { (textField) in
                   textField.text = order.telephone
               }
       
        
        alertController.addTextField { (textField) in
            textField.text = order.productname
        }
       
       alertController.addTextField { (textField) in
                  textField.text = order.productprice
              }
        
        alertController.addTextField { (textField) in
            textField.text = order.deliveryDate
        }
        alertController.addTextField { (textField) in
            textField.text = order.collecitondelivery
        }
        
        
     
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        alertController.addAction(backAction)
        
        
        present(alertController, animated: true, completion: nil)
    }
    
    //function which updates the database
    func update(id:String,name:String,address:String,postcode:String,telephone:String,product:String,price:String,delivery:String,collectionordelivery:String)
    {
        
        
        let order = ["id":id,
                     "Name": name,
                     "Address": address,
                     "Postcode": postcode,
                     "Telephone": telephone,
                     "Product": product,
                     "Price": price,
                     "DeliveryDate": delivery,
                     "CollectionOrDelivery": collectionordelivery
        ]
        
        ref.child(id).setValue(order)
        
        
    }
    
    //function which deletes the order
    func deleteOrder(id:String){
        ref.child(id).setValue(nil)
    }
    
}



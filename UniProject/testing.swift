//
//  testing.swift
//  UniProject
//
//  Created by James Liddle on 20/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase

class testing: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var names: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var testingtab: UITableView!
    var List = [Model]()
     var ref: DatabaseReference!
       
       public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
           return List.count
        
        
       }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
           //creating a cell using the custom class
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
           
           //the artist object
           let product: Model
           
           //getting the artist of selected position
          product = List[indexPath.row]
           
           //adding values to labels
        cell.labelOne.text = product.name
        cell.labelTwo.text = product.number
        cell.labelThree.text = product.prices
        cell.labelFour.text = product.info
           //returning cell
           return cell
       }
    
    
    
    
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      testingtab.delegate = self
             testingtab.dataSource = self
        self.testingtab.rowHeight = 150.0
        ref = Database.database().reference().child("Users").child("products");
        
        ref.observe(DataEventType.value, with: { (snapshot) in
                   
                   //if the reference have some values
                   if snapshot.childrenCount > 0 {
                       
                       //clearing the list
                       self.List.removeAll()
                       
                       //iterating through all the values
                    for products in snapshot.children.allObjects as! [DataSnapshot] {
                           //getting values
                           let productObject = products.value as? [String: AnyObject]
                           let Name = productObject?["Name"]
                           let Number  = productObject?["Number"]
                          let  Price = productObject?["Price"]
                          let Info = productObject?["Info"]
                           
                           //creating artist object with model and fetched values
                        let product = Model(name: Name as! String?, number: Number as! String?, prices: Price as! String?, info: Info as! String?)
                           
                           //appending it to list
                           self.List.append(product)
                       }
                       
                       //reloading the tableview
                       self.testingtab.reloadData()
                   }
               })
        
        
        
        
        
        
    }
    
    @IBAction func uploadtofirebase(_ sender: Any)
    {
        add()
    }
    
    
    func add() //function which adds the information to the database,adds them under the club within the database
       {
           let product = [
                         "Name": names.text! as String,
                         "Number": number.text! as String,
                         "Price": price.text! as String,
                         "Info": info.text! as String
                         
           ]

           ref.childByAutoId().setValue(product)
           
           ref.observe(.value, with: {snapshot in})
           
       }
    
    
    
    
    
    
}

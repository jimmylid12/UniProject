//
//  CustomerViewsController.swift
//  UniProject
//
//  Created by James Liddle on 26/03/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

class CustomerViewsController: UITableViewController,UISearchResultsUpdating
{

     let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var tabView: UITableView!
    
    var customerArray = [NSDictionary?]()
    var filteredCustomers = [NSDictionary?]()
    var databaseRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
               definesPresentationContext = true
               tabView.tableHeaderView = searchController.searchBar
               databaseRef.child("customers").queryOrdered(byChild: "Name").observe(.childAdded, with: { (snapshot) in
                   
                   self.customerArray.append(snapshot.value as? NSDictionary)
                   
                   self.tabView.insertRows(at: [IndexPath(row:self.customerArray.count-1,section:0)], with:
                       UITableView.RowAnimation.automatic)
               }) {(error) in
               
                   print (error.localizedDescription)
               }
        
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int
     {
           
           return 1
       }

         override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
           {
           // #warning Incomplete implementation, return the number of rows
           if searchController.isActive && searchController.searchBar.text != ""{
               return filteredCustomers.count
           }
           return self.customerArray.count
       }
       
       


           
    
     override   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

           let user : NSDictionary?
           
           if searchController.isActive && searchController.searchBar.text != ""
           {
               user = filteredCustomers[indexPath.row]
           }
           else
           {
               
               user = self.customerArray[indexPath.row]
           }
           
           cell.textLabel?.text = user?["Name"] as? String
           cell.detailTextLabel?.text = user?["Price"] as? String
           return cell
       }
       
    
  

    
    
    
           
           func updateSearchResults(for searchController: UISearchController)
           {
               
               filterContent(searchText: self.searchController.searchBar.text!)

            }
           
           func filterContent(searchText:String)
                  {
                      self.filteredCustomers = self.customerArray.filter
                       { user in
                          let username = user!["Name"] as? String
                          return (username?.lowercased().contains(searchText.lowercased()))!
                      
                  
                     
                      
                  }
                      tabView.reloadData()
                  }


}

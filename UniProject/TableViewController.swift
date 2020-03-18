//
//  TableViewController.swift
//  UniProject
//
//  Created by James Liddle on 18/03/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

//this displays information from firebase and allows me to search for the products so i can add them to the order

class TableViewController: UITableViewController,UISearchResultsUpdating
{
   
    

    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet var findproductsTableView: UITableView!
    
    var productsArray = [NSDictionary?]()
    var filteredProducts = [NSDictionary?]()
    var databaseRef = Database.database().reference()
    @IBOutlet var tabView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        databaseRef.child("products").queryOrdered(byChild: "Name").observe(.childAdded, with: { (snapshot) in
            
            self.productsArray.append(snapshot.value as? NSDictionary)
            
            self.tableView.insertRows(at: [IndexPath(row:self.productsArray.count-1,section:0)], with:
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
            return filteredProducts.count
        }
        return self.productsArray.count
    }
    
    

       
        
        
 
  override   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let user : NSDictionary?
        
        if searchController.isActive && searchController.searchBar.text != ""
        {
            user = filteredProducts[indexPath.row]
        }
        else
        {
            
            user = self.productsArray[indexPath.row]
        }
        
        cell.textLabel?.text = user?["Name"] as? String
        cell.detailTextLabel?.text = user?["handle"] as? String
        return cell
    }
    
        
        func updateSearchResults(for searchController: UISearchController)
        {
            
            filterContent(searchText: self.searchController.searchBar.text!)

         }
        
        func filterContent(searchText:String)
               {
                   self.filteredProducts = self.productsArray.filter
                    { user in
                       let username = user!["Name"] as? String
                       return (username?.lowercased().contains(searchText.lowercased()))!
                   
               
                  
                   
               }
                   tabView.reloadData()
               }


}

//
//  testing.swift
//  UniProject
//
//  Created by James Liddle on 20/02/2020.
//  Copyright © 2020 James Liddle. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices
//adds the product to the database by the admin team

class testing: UIViewController, UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var names: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var testingtab: UITableView!
    var List = [Model]()
    var ref: DatabaseReference!
    var imagePickerController : UIImagePickerController!
    var downloadURL = "temp"
     var product = "product"
      
    
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
        
        ref = Database.database().reference().child("products");
        
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
                    let ID = productObject?["id"]
                    let Info = productObject?["Info"]
                    
                    //creating artist object with model and fetched values
                    let product = Model(id: ID as! String?,name: Name as! String?, number: Number as! String?, prices: Price as! String?, info: Info as! String?)
                    
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
            uploadImagePic(img1: imageView.image!) //calls upload image pic which in turn calls add inoformation
            
            NSLog("Uploading...")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           
           var selectedImageFromPicker: UIImage?
           if let editedImage = info[.editedImage] as? UIImage
           {
               selectedImageFromPicker = editedImage
           }
           else if let originalImage = info[.originalImage] as? UIImage
           {
               selectedImageFromPicker = originalImage
           }
           
           if let selectedImage = selectedImageFromPicker
           {
               imageView.image = selectedImage
           }
           dismiss(animated: true, completion: nil)
       }
    
    @IBAction func addPicture(_ sender: Any)
    {
        let profileImagePicker = UIImagePickerController()
        profileImagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
           profileImagePicker.mediaTypes = [kUTTypeImage as String]
           profileImagePicker.delegate = self
           present(profileImagePicker, animated: true, completion: nil)
    }
    
    
    
    func add() //function which adds the information to the database,adds them under the product within the database
    {
         let key = ref.childByAutoId().key
        
        let product = [
            
            "id":key,
            "Name": names.text! as String,
            "Number": number.text! as String,
            "Price": price.text! as String,
            "Info": info.text! as String,
            "imgUrl":self.downloadURL as String
                      
        ]
        
        ref.childByAutoId().setValue(product)
        
        ref.observe(.value, with: {snapshot in})
        
    }
    
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
       //getting the selected artist
       let product  = List[indexPath.row]
   
       //building an alert
    let alertController = UIAlertController(title: product.name, message: "Give new values to update ", preferredStyle: .alert)
   
       //the confirm action taking the inputs
       let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
           
           //getting artist id
        let id = product.id
           
           //getting new values
        let name = alertController.textFields?[1].text
         let number = alertController.textFields?[2].text
        let price = alertController.textFields?[0].text
       let info = alertController.textFields?[3].text
          
           
           //calling the update method to update artist
        self.update(id: id!,name: name!, number: number!,price:price!,info: info!)
       }
   
       //the cancel action doing nothing
      
    
       
    
    alertController.addTextField { (textField) in
           textField.text = product.name
       }
    alertController.addTextField { (textField) in
           textField.text = product.number
          }
    
       //adding two textfields to alert
       alertController.addTextField { (textField) in
        textField.text = product.prices
       }
      
    alertController.addTextField { (textField) in
        textField.text = product.info
    }
   
       //adding action
       alertController.addAction(confirmAction)
     //  alertController.addAction(cancelAction)
   
       //presenting dialog
       present(alertController, animated: true, completion: nil)
   }

    func update(id:String,name:String, number:String,price:String,info:String)
    {
       let product = [
           "id":id,
           "Name": name,
           "Number": number,
           "Price": price,
           "Info": info
           
           
       ]
      ref.child(id).setValue(product)
        
        
    }
    
    
    
    func uploadImagePic(img1 :UIImage)
       {
           guard let data = img1.jpegData(compressionQuality: 0.75) else { return }
           // set upload path
           let product = number.text!
           let filePath = "\(product).jpg" // path where you wanted to store img in storage
           let metaData = StorageMetadata()
           metaData.contentType = "image/jpg"
           
           let storageRef = Storage.storage().reference()
           
           storageRef.child("club_profile").child(filePath).putData(data as Data, metadata: metaData){(metaData,error) in
               if let error = error
               {
                   print(error.localizedDescription)
                   self.downloadURL = "error"
                   return
               }
               else
               {
                   // Fetch the download URL
                   storageRef.child("club_profile").child(filePath).downloadURL
                   {
                       url, error in if error != nil
                           {
                               self.downloadURL = "error in loop"
                           }
                           else
                           {
                               self.downloadURL = url!.path
                               self.add()
                           }
                   }
               }
           }
       }
    
}

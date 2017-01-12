
//
//  DescriptionViewController.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var backgroundImage : UIImageView!;
    @IBOutlet var detailName: UILabel!
    var storeName:String = ""
    var barDelegate:Bars?
    var dealDelegate:Deals?
    
    var hangOutsData:NSMutableArray = NSMutableArray()
    
    var currentObject : PFObject?
    
    @IBOutlet var tableView: UITableView!
    
    func setUp()
    {
        tableView = UITableView()
    }
    
    @IBAction func addDeal(_ sender: AnyObject) {
        
        let loginAlert:UIAlertController = UIAlertController(title: "Enter Deal",message: "Please enter the product's name and price",
            preferredStyle: UIAlertControllerStyle.alert)
        
        loginAlert.addTextField(
            configurationHandler: {
                textfield in
                textfield.placeholder = "Product:"
        })
        
        loginAlert.addTextField(
            configurationHandler: {
                textfield in
                textfield.placeholder = "Price:"
                textfield.isSecureTextEntry = false
        })
        
        loginAlert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler:
            {
                alertAction in
                let textFields:NSArray = loginAlert.textFields! as NSArray
                let usernameTextfield:UITextField = textFields.object(at: 0) as! UITextField
                let passwordTextfield:UITextField = textFields.object(at: 1) as! UITextField
                
                if (usernameTextfield.text! != "" && passwordTextfield.text! != "")
                {
                    //check why deal is not being added
                    //data.addDeal(usernameTextfield.text!, price:Int(passwordTextfield.text!)!)
                    self.barDelegate?.deals.append(Deals(name: usernameTextfield.text!, price:Float(passwordTextfield.text!)!, barID: self.barDelegate!.barID))
                    let alert = UIAlertView()
                    alert.title = "Thank You"
                    alert.message = "You have successfully created a deal"
                    alert.addButton(withTitle: "Ok")
                    alert.show()
                    
                    print("Thank You, You have successfully created a deal")
                    self.tableView.reloadData()
                    
                }
                else
                {
                    let alert = UIAlertView()
                    alert.title = "Warning"
                    alert.message = "Missing Entries"
                    alert.addButton(withTitle: "Ok")
                    alert.show()
                    
                    print("Missing Entries")
                    self.present(loginAlert, animated: true, completion: nil)
                }
        }))
        loginAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(loginAlert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        backgroundImage = UIImageView(image: UIImage(named: "Mojito.jpg"))
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        detailName.text! = storeName
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.loadData()
    }
    
    func loadData()
    {
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //return data.getDealCountBarID(self.barDelegate!.barID)
        return self.barDelegate!.getDealCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! DealsTableViewCell
        //let deal = data.getNextDealBarID(indexPath.row, barID: self.barDelegate!.barID)
        let deal = self.barDelegate!.getDeal(indexPath.row)
//        cell.dealDelegate = deal
        dealDelegate = deal
        cell.dealName.text! = deal.name
        cell.dealPrice.text! = String(deal.price)
        cell.percentGood.text! = "%\(deal.percentageOfLikes())"
        return cell
    }
    
    @IBAction func badClick(_ sender: AnyObject) {
        dealDelegate?.downvotes += 1
        self.loadData()
    }
    @IBAction func goodClick(_ sender: AnyObject) {
        dealDelegate?.upvotes += 1
        self.loadData()
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

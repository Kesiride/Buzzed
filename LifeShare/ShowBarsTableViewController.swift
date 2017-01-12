//
//  ShowBarsTableViewController.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class ShowBarsTableViewController: UITableViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate  {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    var backgroundImage : UIImageView!;
    var barData:NSMutableArray = NSMutableArray()

    
    @IBAction func logoutAction(_ sender: AnyObject) {
        
        PFUser.logOut()
        self.loginSetup()
    }
    
    func loginSetup() {
        
        if (PFUser.current() == nil) {
            //            let loginViewController = PFLogInViewController()
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            loginViewController.fields = [.usernameAndPassword, .logInButton, .passwordForgotten, .signUpButton, .facebook]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController!.delegate = self
            
            self.present(loginViewController, animated: false, completion: nil)        }
        else{
            presentLoggedInAlert()
        }
    }
    func log(_ logInController: PFLogInViewController, didLogIn user: PFUser) {
        self.dismiss(animated: true, completion: nil)
        presentLoggedInAlert()
    }
    
    func presentLoggedInAlert() {
        let alertController = UIAlertController(title: "You're logged in", message: "Welcome to Buzzed", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func signUpViewController(_ signUpController: PFSignUpViewController, didSignUp user: PFUser) {
        self.dismiss(animated: true, completion: nil)
        presentLoggedInAlert()
    }
    
    //    @IBAction func logoutAction(sender: AnyObject)
    //    {
    //        PFUser.logOut()
    //        print("You have logged out")
    //        self.loginSetup()
    //
    //    }
    
    //    func loadData()
    //    {
    //        hangOutsData.removeAllObjects()
    //        let findHangOutData:PFQuery = PFQuery(className: "Bars")
    //        findHangOutData.findObjectsInBackgroundWithBlock{(objects: [AnyObject]?, error: NSError?) -> Void in
    //
    //            if error == nil
    //            {
    //                if let myObject = objects{
    //                    for object in myObject{
    //                        let hangOuts:PFObject = object as! PFObject
    //                        self.hangOutsData.addObject(hangOuts)
    //
    //                    }
    //                }
    //                let array:NSArray = self.hangOutsData.reverseObjectEnumerator().allObjects
    //                self.hangOutsData =  NSMutableArray(array: array)
    //
    //                self.tableView.reloadData()
    //            }
    //
    //        }
    //    }
    //
    override func viewDidLoad() {
        
        backgroundImage = UIImageView(image: UIImage(named: "Mojito.jpg"))
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        //	ScrollView.contentSize.height = 1000
    }
    
    override func viewWillAppear(_ animated: Bool) {

        self.tableView.reloadData()
        //super.viewWillAppear(animated)
    }
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        self.navigationController?.title = "Buzzed"
    //
    //        // Uncomment the following line to preserve selection between presentations
    //        // self.clearsSelectionOnViewWillAppear = false
    //
    //        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.getCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BarTableViewCell
        
        // Configure the cell...
        
        let bar = data.getBar(indexPath.row)
        
        cell.barName.text! = bar.name
        /*
        print(data.getDealCountBarID(bar.barID))
        cell.totalDeals.text! = String(data.getDealCountBarID(bar.barID))
        */
        cell.totalDeals.text! = String(bar.getDealCount())
        cell.distance.text! = "\(bar.distance) mi"
        cell.pic.image = bar.image
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Show Detail" {
            let secondVC:DescriptionViewController = segue.destination as! DescriptionViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let bar = data.getBar(indexPath.row)
                
                //print(bar.name)
                secondVC.storeName = bar.name
                secondVC.barDelegate = bar
            }
        }
    }
}


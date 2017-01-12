//
//  ViewController.swift
//  LifeShare
//
//  Created by Alan Guerrero on 10/27/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

var data:DataModel = DataModel()

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    @IBOutlet var introWarn: UIImageView!
    override func viewDidLoad() {
        introWarn.image = UIImage(named:"caution.png")
        self.loginSetup()
        
        super.viewDidLoad()
        self.loginSetup()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginSetup() {
        
        if (PFUser.current() == nil) {
            //       let loginViewController = PFLogInViewController()
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
    
    override func viewDidAppear(_ animated: Bool) {
        self.loginSetup()
        
        super.viewDidAppear(animated)
        
        self.loginSetup()
        
    }
    
}

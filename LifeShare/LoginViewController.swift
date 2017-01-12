//
//  LoginViewController.swift
//  LifeShare
//
//  Created by Alan Guerrero on 11/10/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import Foundation


class LoginViewController : PFLogInViewController {
    
    var viewsToAnimate: [UIView?]!;
    
    var viewsFinalYPosition : [CGFloat]!;
    
    var backgroundImage : UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set our custom background image
        backgroundImage = UIImageView(image: UIImage(named: "Login_image"))
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.logInView!.insertSubview(backgroundImage, at: 0)
        
        // remove the parse Logo
        let logo = UILabel()
        logo.text = "Buzzed"
        logo.font = UIFont(name: "Arial", size: 70)
        logo.textColor = UIColor.white
        //        logo.font = UIFont(name: "", size: 70)
        logo.shadowColor = UIColor.lightGray
        logo.shadowOffset = CGSize(width: 2, height: 2)
        logInView?.logo = logo
        
        // set forgotten password button to white
        //        logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        // make the background of the login button pop more
        logInView?.logInButton?.setBackgroundImage(nil, for: UIControlState())
        logInView?.logInButton?.backgroundColor = UIColor(red: 52/255, green: 191/255, blue: 73/255, alpha: 1)
        
        logInView?.usernameField?.placeholder = "user"

        self.signUpController = SignUpViewController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // stretch background image to fill screen
        backgroundImage.frame = CGRect( x: 0,  y: 0,  width: self.logInView!.frame.width,  height: self.logInView!.frame.height)
        backgroundImage.frame = CGRect( x: 0,  y: 0,  width: logInView!.frame.width,  height: logInView!.frame.height)
        
        // position logo at top with larger frame
        logInView!.logo!.sizeToFit()
        let logoFrame = logInView!.logo!.frame
        logInView!.logo!.frame = CGRect(x: logoFrame.origin.x, y: logInView!.usernameField!.frame.origin.y - logoFrame.height - 16, width: logInView!.frame.width,  height: logoFrame.height)
        
        logInView?.usernameField?.placeholder = "Username"
    }
    
}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/



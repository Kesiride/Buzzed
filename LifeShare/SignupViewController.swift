//
//  SignupViewController.swift
//  LifeShare
//
//  Created by Alan Guerrero on 11/10/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation

class SignUpViewController : PFSignUpViewController {
    
    var backgroundImage : UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set our custom background image
        backgroundImage = UIImageView(image: UIImage(named: "Mojito.jpg"))
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        signUpView!.insertSubview(backgroundImage, at: 0)
        
        // remove the parse Logo
        let logo = UILabel()
        logo.text = "Buzzed"
        logo.font = UIFont(name: "Arial", size: 70)
        logo.textColor = UIColor.white
        //        logo.font = UIFont(name: "", size: 70)
        logo.shadowColor = UIColor.lightGray
        logo.shadowOffset = CGSize(width: 2, height: 2)
        signUpView?.logo = logo
        
        // make the background of the sign up button pop more
        signUpView?.signUpButton!.setBackgroundImage(nil, for: UIControlState())
        signUpView?.signUpButton!.backgroundColor = UIColor(red: 52/255, green: 191/255, blue: 73/255, alpha: 1)
        
        // change dismiss button to say 'Already signed up?'
        signUpView?.dismissButton!.setTitle("Already signed up?", for: UIControlState())
        signUpView?.dismissButton!.setImage(nil, for: UIControlState())
        
        // modify the present tranisition to be a flip instead
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // stretch background image to fill screen
        backgroundImage.frame = CGRect( x: 0,  y: 0,  width: signUpView!.frame.width,  height: signUpView!.frame.height)
        
        // position logo at top with larger frame
        signUpView!.logo!.sizeToFit()
        let logoFrame = signUpView!.logo!.frame
        signUpView!.logo!.frame = CGRect(x: logoFrame.origin.x, y: signUpView!.usernameField!.frame.origin.y - logoFrame.height - 16, width: signUpView!.frame.width,  height: logoFrame.height)
        
        // re-layout out dismiss button to be below sign
        let dismissButtonFrame = signUpView!.dismissButton!.frame
        signUpView?.dismissButton!.frame = CGRect(x: 0, y: signUpView!.signUpButton!.frame.origin.y + signUpView!.signUpButton!.frame.height + 16.0,  width: signUpView!.frame.width,  height: dismissButtonFrame.height)
    }
}

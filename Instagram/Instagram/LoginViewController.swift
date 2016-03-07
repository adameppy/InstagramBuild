//
//  LoginViewController.swift
//  Instagram
//
//  Created by Adam Epstein on 3/6/16.
//  Copyright © 2016 Adam Epstein. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("You're logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else{
                print("Log in failed")
            }
        }
    }
    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        
    
        
        // set user properties
        newUser.username = usernameField.text
        //newUser.email = emailField.text
        newUser.password = passwordField.text
        //print(newUser)
        
        // call sign up function on the object
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                //print(error)
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                // manually segue to logged in view
            }
        }
    }
}

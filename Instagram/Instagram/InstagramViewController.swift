//
//  InstagramViewController.swift
//  Instagram
//
//  Created by Adam Epstein on 3/6/16.
//  Copyright © 2016 Adam Epstein. All rights reserved.
//

import UIKit
import Parse

class InstagramViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("logoutSegue", sender: nil)
    }

}


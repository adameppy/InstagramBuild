//
//  InstagramViewController.swift
//  Instagram
//
//  Created by Adam Epstein on 3/6/16.
//  Copyright © 2016 Adam Epstein. All rights reserved.
//

import UIKit
import Parse

class InstagramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts: [PFObject]!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        let query = PFQuery(className: "Post")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // do something with the array of object returned by the call
                self.posts = posts
                for post in posts{
                    print(post)
                }
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("pictureCell", forIndexPath: indexPath) as! PictureCell
            let post = posts[indexPath.row]
            
            if let caption = post["caption"]! as? String{
                cell.captionLabel.text = caption
            }
            else{
                cell.captionLabel.text = ""
            }
            
            if let image = post["media"] as! PFFile! {
                image.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
                    if (error == nil){
                        cell.pictureView.image = UIImage(data:imageData!)
                    }
                    else{
                        print(error?.localizedDescription)
                    }
                })
            }
            
            
            
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            if(posts != nil){
                return posts.count
            }
            else{
                return 0
            }
    }
    

    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("logoutSegue", sender: nil)
    }

}


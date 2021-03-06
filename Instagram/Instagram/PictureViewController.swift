//
//  PictureViewController.swift
//  Instagram
//
//  Created by Adam Epstein on 3/7/16.
//  Copyright © 2016 Adam Epstein. All rights reserved.
//

import UIKit
import Parse

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var vc: UIImagePickerController!
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePicture(sender: AnyObject) {
        vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
       
    }
    
    @IBAction func addPicture(sender: AnyObject) {
        vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            
            // Dismiss UIImagePickerController to go back to your original view controller
            
            dismissViewControllerAnimated(true, completion: nil)
            pictureView.image = editedImage
    }
    
    @IBAction func onSubmit(sender: AnyObject) {
        Post.postUserImage(pictureView.image, withCaption: captionField.text) { (success: Bool, error: NSError?) -> Void in
            if success{
                print("Posted to instagram successfully")
                self.navigationController?.popToRootViewControllerAnimated(true)
                
            } else{
                print(error?.localizedDescription)
            }
        }
    }
    
    func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
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

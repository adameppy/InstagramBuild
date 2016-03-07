//
//  PictureCell.swift
//  Instagram
//
//  Created by Adam Epstein on 3/7/16.
//  Copyright © 2016 Adam Epstein. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

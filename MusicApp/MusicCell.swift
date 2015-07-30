//
//  MusicCell.swift
//  MusicApp
//
//  Created by Shrikar Archak on 6/19/15.
//  Copyright © 2015 Shrikar Archak. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var genre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    

}

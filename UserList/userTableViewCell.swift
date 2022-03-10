//
//  userTableViewCell.swift
//  UserList
//
//  Created by admin on 04/03/2022.
//

import UIKit

class userTableViewCell: UITableViewCell {

    
    //@IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    //@IBOutlet weak var userAvatar: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var userFirstName: UILabel!
    //@IBOutlet weak var userEmail: UILabel!
    //@IBOutlet weak var userId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

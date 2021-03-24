//
//  MyTableViewCell.swift
//  SpaceInvaders_NOTSPRITE
//
//  Created by Max on 24.03.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var nickNamePlayer: UILabel!
    @IBOutlet weak var scorePlayer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

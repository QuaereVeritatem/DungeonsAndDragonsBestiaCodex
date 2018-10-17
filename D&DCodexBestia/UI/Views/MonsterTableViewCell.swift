//
//  MonsterTableViewCell.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/12/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class MonsterTableViewCell: UITableViewCell {

  @IBOutlet weak var monsterIcon: UIImageView!
  @IBOutlet weak var monsterType: UILabel!
  @IBOutlet weak var monsterSize: UILabel!
  @IBOutlet weak var armorClassNum: UILabel!
  @IBOutlet weak var indexNum: UILabel!
  @IBOutlet weak var challengeRatingNum: UILabel!
  @IBOutlet weak var hitPointsNum: UILabel!
  @IBOutlet weak var monsterName: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

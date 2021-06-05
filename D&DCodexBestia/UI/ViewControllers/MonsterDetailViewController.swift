//
//  MonsterDetailViewController.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/12/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

class MonsterDetailViewController: UIViewController {

  @IBOutlet weak var indexNum: UILabel!
  @IBAction func backBtn(_ sender: UIButton) {
    if previousScreenName == "ChallengeRatingDetailViewController" {
      performSegue(withIdentifier: "unwindToChallengeRatingDetailViewController", sender: self)
    } else {
      performSegue(withIdentifier: "unwindToViewController", sender: self)
    }
  }
  @IBOutlet weak var monsterAvatar: UIImageView!
  @IBOutlet weak var monsterName: UILabel!
  // swap these three for UITextViews! then they will be multi lines!!
  @IBOutlet weak var attributesTextField: UITextView!
  @IBOutlet weak var damageTextField: UITextView!
  @IBOutlet weak var abilitiesTextField: UITextView!
  var screenName = "MonsterDetailViewController"
  var previousScreenName: String = ""
  var monsterCount: Int?
  var monsters: [MonsterModel] = [MonsterModel]()
  var monster: MonsterModel?
  var canSwim: String = ""
  var canWalk: String = ""
  
  // this is for action names
  var titleFont = UIFont.systemFont(ofSize:18)
  // this is for action descritpion
  var contentFont = UIFont.systemFont(ofSize:18)
  
    override func viewDidLoad() {
      super.viewDidLoad()
      monster = monsters.first
      // Do any additional setup after loading the view.
      monsterName.text! = monster!.name
      indexNum.text! = String(monster!.alignment)
      
      switch monster!.type {
      case "aberration": monsterAvatar.image! = UIImage(named: "Aberration")!
        case "beast": monsterAvatar.image! = UIImage(named: "Beast")!
        case "celestial": monsterAvatar.image! = UIImage(named: "Celestial")!
        case "construct": monsterAvatar.image! = UIImage(named: "Construct")!
        case "dragon": monsterAvatar.image! = UIImage(named: "DragonIconAvatar")!
        case "fey": monsterAvatar.image! = UIImage(named: "Fey")!
        case "fiend": monsterAvatar.image! = UIImage(named: "Fiend")!
        case "giant": monsterAvatar.image! = UIImage(named: "Giant")!
        case "ooze": monsterAvatar.image! = UIImage(named: "OOze")!
        case "plant": monsterAvatar.image! = UIImage(named: "PLant")!
        case "swarm of Tiny beasts": monsterAvatar.image! = UIImage(named: "swarm")!
        case "undead": monsterAvatar.image! = UIImage(named: "Undead")!
        case "humanoid": monsterAvatar.image! = UIImage(named: "Humanoid")!
        case "monstrosity": monsterAvatar.image! = UIImage(named: "Monstrosity")!
        case "elemental": monsterAvatar.image! = UIImage(named: "Elemental")!
        default: monsterAvatar.image! = UIImage(named: "WolfIcon")!
      }
      let spaces = "          "
      
      // safely get swim and/or walk
      if let possSwim = monster!.speed?.swim {
        canSwim = "Swim:  " + possSwim
      } else {
        canSwim = "Swim:  Cant Swim(N/A)"
      }
      if let possWalk = monster!.speed?.walk {
        canWalk = "Walk:  " + possWalk
      } else {
        canWalk = "Walk:  Too Slow(N/A)"
      }
      
      // index 1 aboleth crashes here
      let attributes: String = "\(monster!.type)" + spaces + spaces + "\(monster!.size)  \r" + "[Speed] \(canSwim)" + "   " + "\(canWalk)" + "\r" + "Alignment:  \(monster!.alignment) " + "       " + "Armor Class: \(monster!.armorClass) \r" + "Hit Points: \(monster!.hitPoints)         " + "      Challenge Rating: \(monster!.challengeRating) \r \r" + "Strength: \(monster!.strength)" + spaces + "Dex: \(monster!.dexterity)" + spaces + "Const: \(monster!.constitution) \r" + "Int: \(monster!.intelligence)" + spaces + "Wis: \(monster!.wisdom)" + spaces
      // + "Cha: \(monster!.charisma) \r"
      attributesTextField.text! = attributes
      
      // dont forget to add "if legendary_actions != nil" so we can add those too
      var damage: String = ""
      for loop in 0...monster!.actions!.count - 1 {
        let actionName = monster!.actions![loop].name
        let actionDescription = " - " + monster!.actions![loop].desc + "\r"
        // find a way to change font for above strings
        damage += actionName + actionDescription
      }
      damageTextField.text! = damage
      
      var abilities: String = ""
      if let specAbil = monster!.specialAbilities {
        for specloop in 0...specAbil.count - 1 {
          let specAbilName = specAbil[specloop].name
          let specAbilDescription = " - " + specAbil[specloop].desc + "\r"
          // find a way to change font for above strings
          abilities += specAbilName + specAbilDescription
        }
      }
      abilitiesTextField.text! = abilities
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  // MARK ** TableView functions
 /*
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let cCount = monsterCount {
      return cCount
    } else {
      let cCount = 5
      return cCount
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "mmonsterCell") as! MonsterTableViewCell
    cell.indexNum.text! = "Place var here"
    // cell.monsterAvatar.image =
    cell.monsterName.text! = "Place var here"
    let attributes: String = "\(monster?.type) /n \(monster?.size) /n Speed: \(monster?.speed)"
    attributesTextField.text! = attributes
    let damage: String = ""
    // damageTextField.text! = this doesnt work
    let abilities: String = ""
    // abilitiesTextField.text! = this doesnt work
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCell = indexPath.row
    
    // self.performSegue(withIdentifier: "class2ClassDetail", sender: self) //not here, unwind from btn function
  }
  */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

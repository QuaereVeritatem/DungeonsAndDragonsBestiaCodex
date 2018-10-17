//
//  ChallengeRatingDetailViewController.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/12/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import UIKit

// tableView protocols needed
class ChallengeRatingDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var challengeRatingBannerNum: UILabel!
  @IBAction func unwindToChallengeRatingDetailViewController(segue:UIStoryboardSegue) { }
  var monsters: [MonsterModel] = []
  var chosenDetailMonster: MonsterModel?
  var monsterCount: Int?
  var challengeRatingArray: [MonsterModel] = [MonsterModel]()
  var screenName = "ChallengeRatingDetailViewController"
  
    override func viewDidLoad() {
      super.viewDidLoad()
      //find a way to get this to be an integer not a float
      challengeRatingBannerNum.text! = String(challengeRatingArray.first!.challengeRating)
      // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  // MARK: - TableView functions
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return challengeRatingArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell") as! ChallengeRatingTableViewCell
    
      cell.indexNum.text! = String(challengeRatingArray[indexPath.row].index)
      cell.monsterName.text! = challengeRatingArray[indexPath.row].name
      cell.armorClassNum.text! = String(challengeRatingArray[indexPath.row].armorClass)
      cell.monsterType.text! = challengeRatingArray[indexPath.row].type
      cell.monsterSize.text! = challengeRatingArray[indexPath.row].size
      cell.challengeRatingNum.text! = String(challengeRatingArray[indexPath.row].challengeRating)
      cell.hitPointsNum.text! = String(challengeRatingArray[indexPath.row].hitPoints)

    switch challengeRatingArray[indexPath.row].type {
      case "aberration": cell.monsterIcon.image = UIImage(named: "Aberration")
      case "beast": cell.monsterIcon.image = UIImage(named: "Beast")
      case "celestial": cell.monsterIcon.image = UIImage(named: "Celestial")
      case "construct": cell.monsterIcon.image = UIImage(named: "Construct")
      case "dragon": cell.monsterIcon.image = UIImage(named: "DragonIconAvatar")
      case "fey": cell.monsterIcon.image = UIImage(named: "Fey")
      case "fiend": cell.monsterIcon.image = UIImage(named: "Fiend")
      case "giant": cell.monsterIcon.image = UIImage(named: "Giant")
      case "ooze": cell.monsterIcon.image = UIImage(named: "OOze")
      case "plant": cell.monsterIcon.image = UIImage(named: "PLant")
      case "swarm of Tiny beasts": cell.monsterIcon.image = UIImage(named: "swarm")
      case "undead": cell.monsterIcon.image = UIImage(named: "Undead")
      case "humanoid": cell.monsterIcon.image = UIImage(named: "Humanoid")
      case "monstrosity": cell.monsterIcon.image = UIImage(named: "Monstrosity")
      case "elemental": cell.monsterIcon.image = UIImage(named: "Elemental")
      default: cell.monsterIcon.image = UIImage(named: "WolfIcon")
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCell = indexPath.row
    chosenDetailMonster = challengeRatingArray[selectedCell]
    self.performSegue(withIdentifier: "challenge2Monster", sender: self)
  }
  
  func avatarBasedOnType(monsterType: String) {
    
    
    // return image string to use
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is MonsterDetailViewController {
      print("The segue identifier is \(String(describing: segue.identifier))")
      let vc = segue.destination as? MonsterDetailViewController
      vc!.previousScreenName = screenName
      vc?.monsters.append(chosenDetailMonster!)
      //  print("We sending the challenge rating \(selectedCRArray[0].challengeRating) over")
    }
  }

  
  
  
}

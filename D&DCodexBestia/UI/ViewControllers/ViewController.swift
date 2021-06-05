//
//  ViewController.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/5/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//
// This app is designed to show all monsters and their info from the D&D API
// todo: 1) error handling for monsterdetailviewcontroller textfields 3) loading icon (for when downloading JSON)
//         4) it takes a long time to initially load the monster table 5) *** index text flowing outside of constraint
//         6) *** challenge rating not working now

import UIKit
import CoreData

enum ChallengeRatingRanges {
  case zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen,  sixteen, seventeen, eightteen, nineteen, twenty, twentyone, twentytwo, twentythree, twentyfour
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var tableView: UITableView!
  @IBAction func unwindToViewController(segue:UIStoryboardSegue) { }
  
  var getDataSuccedded = false
  let mygroup = DispatchGroup()
  var activityIndicator = UIActivityIndicatorView()
  var monsters: [MonsterModel] = [MonsterModel]()
  var monsterResults: MonsterResultsModel?
  var monstersSavedOnDisk: [NSManagedObject] = []
  var monsterCount: Int?
  var finalMonsterCount = 10
  var screenName = "ViewController"
  // this is for CR 1-20 and the first one which is <1 [i.e. 0.25, 0, 0.75 etc]
  var challengeRatingCount: Int = 31
  var challengeRatingLabelsArray = ["<1", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
  // this will count the number of monsters for each Challenge rating category
  var challengeRatingArrayCount = 0
  var challengeRatingMonsterArray: [[MonsterModel]] = [[MonsterModel]]()   // we need to count CR's for each monster and then organize?
  var selectedCRArray = [MonsterModel]()
  var chosenDetailMonster: MonsterModel?
  var challengeRatingArray0: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray1: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray2: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray3: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray4: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray5: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray6: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray7: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray8: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray9: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray10: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray11: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray12: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray13: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray14: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray15: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray16: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray17: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray18: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray19: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray20: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray21: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray22: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray23: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray24: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray25: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray26: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray27: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray28: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray29: [MonsterModel] = [MonsterModel]()
  var challengeRatingArray30: [MonsterModel] = [MonsterModel]() 
  
  override func viewDidLoad() {
   // getData()
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    collectionView.dataSource = self
    collectionView.delegate = self
    
    // still need to setup saveData()
    // if getDataSuccedded == false {
      monsterCount = urlRequestAndParseForTotal()
      // find a way to make this loop based on monster count
    /*
      for loop in 1...monsterCount! {
        cellJSONPull(cellNumber: loop)
        monsters.sort {
          $0.index < $1.index
        }
      }   */
    // }
    self.tableView.reloadData()
    self.collectionView.reloadData()
  }
  
 // MARK: - TableViews
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 6
    if (monsters.count < 325 - 300) {
      return count
    } else {
      count = monsters.count
    }
    return count
    }
  
  // do JSON pull on each cell
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "monsterCell") as! MonsterTableViewCell
    
    if monsters.count < 150 {
       //do nothing, json hasnt loaded yet
    } else {
     // print("at index # \(indexPath.row) is monster \(String(monsters[indexPath.row].index))")
      // chain bind unwrap and no more crashing!!! [FIX]
      let align = monsters[indexPath.row].alignment
      cell.indexNum.text! = String(align)
      
      let mName = monsters[indexPath.row].name
      cell.monsterName.text! = mName
      
      let arClass = monsters[indexPath.row].armorClass
      cell.armorClassNum.text! = String(arClass)
      
      let mType = monsters[indexPath.row].type
      cell.monsterType.text! = mType
      
      let mSize = monsters[indexPath.row].size
      cell.monsterSize.text! = mSize
      
      let cRNum = monsters[indexPath.row].challengeRating
      cell.challengeRatingNum.text! = String(cRNum)
      
      let hPoints = monsters[indexPath.row].hitPoints
      cell.hitPointsNum.text! = String(hPoints)
      
      switch monsters[indexPath.row].type {
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
    }
    //self.tableView?.reloadData()
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.dequeueReusableCell(withIdentifier: "monsterCell") as! MonsterTableViewCell
    let selectedCell = indexPath.row
    // not working !!!!
    /*
    if monsters[selectedCell].type == "dragon" {
      cell.monsterIcon.image = UIImage(named: "DragonHighlightedIcon")
    } else {
      cell.monsterIcon.image = UIImage(named: "WolfHighlightedIcon")
    }  */
    chosenDetailMonster = monsters[selectedCell]
    self.performSegue(withIdentifier: "view2Monster", sender: self)
  }

  // MARK: - CollectionView
  
  func collectionView(_: UICollectionView, numberOfItemsInSection: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return challengeRatingLabelsArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: cellForItemAt) as! ChallengeRatingCollectionViewCell
    cell.challengeRatingNum.text! = challengeRatingLabelsArray[cellForItemAt.section]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    var selectedChallengeRatingArray = [MonsterModel]()
    // code goes here for when we select the cell...and what info we want to send on
    switch indexPath.section  {
    case 0:
       selectedChallengeRatingArray = challengeRatingArray0
       print("This is the case statement zero")
    case 1:
       selectedChallengeRatingArray = challengeRatingArray1
    case 2:
       selectedChallengeRatingArray = challengeRatingArray2
    case 3:
       selectedChallengeRatingArray = challengeRatingArray3
    case 4:
        selectedChallengeRatingArray = challengeRatingArray4
    case 5:
        selectedChallengeRatingArray = challengeRatingArray5
    case 6:
        selectedChallengeRatingArray = challengeRatingArray6
    case 7:
        selectedChallengeRatingArray = challengeRatingArray7
    case 8:
        selectedChallengeRatingArray = challengeRatingArray8
    case 9:
        selectedChallengeRatingArray = challengeRatingArray9
    case 10:
        selectedChallengeRatingArray = challengeRatingArray10
    case 11:
        selectedChallengeRatingArray = challengeRatingArray11
    case 12:
        selectedChallengeRatingArray = challengeRatingArray12
    case 13:
        selectedChallengeRatingArray = challengeRatingArray13
    case 14:
        selectedChallengeRatingArray = challengeRatingArray14
    case 15:
        selectedChallengeRatingArray = challengeRatingArray15
    case 16:
        selectedChallengeRatingArray = challengeRatingArray16
    case 17:
        selectedChallengeRatingArray = challengeRatingArray17
    case 18:
        selectedChallengeRatingArray = challengeRatingArray18
    case 19:
        selectedChallengeRatingArray = challengeRatingArray19
    case 20:
        selectedChallengeRatingArray = challengeRatingArray20
    case 21:
        selectedChallengeRatingArray = challengeRatingArray21
    case 22:
        selectedChallengeRatingArray = challengeRatingArray22
    case 23:
        selectedChallengeRatingArray = challengeRatingArray23
    case 24:
        selectedChallengeRatingArray = challengeRatingArray24
    case 25:
        selectedChallengeRatingArray = challengeRatingArray25
    case 26:
        selectedChallengeRatingArray = challengeRatingArray26
    case 27:
        selectedChallengeRatingArray = challengeRatingArray27
    case 28:
        selectedChallengeRatingArray = challengeRatingArray28
    case 29:
        selectedChallengeRatingArray = challengeRatingArray29
    case 30:
        selectedChallengeRatingArray = challengeRatingArray30
    default:
        selectedChallengeRatingArray = challengeRatingArray0
        print("This is the default case statement zero")
    }
    selectedCRArray = selectedChallengeRatingArray
    for loop in 0...selectedChallengeRatingArray.count - 1 {
      print("These are the monsters with the Challenge rating \(indexPath.row) \(selectedChallengeRatingArray[loop])")
    }
     self.performSegue(withIdentifier: "view2Challenge", sender: self)
     //let vc = segue.destination as? ChallengeRatingDetailViewController
  }
  
  // MARK: - Logic Functions
  
  func urlRequestAndParseForTotal() -> Int {
    var count = 1
    let urlString = BaseUrl
    guard let url = URL(string: urlString) else { return 0 }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      guard let data = data else { return }
      //Implement JSON decoding and parsing
      do {
        //Decode retrived data with JSONDecoder and assing type of Article object
        let endPointData = try JSONDecoder().decode(MonsterResultsModel.self, from: data)
        let monsterRes = endPointData
        count = monsterRes.count
        self.finalMonsterCount = count
        self.monsterResults = monsterRes
        //print("The count is \(count)")
        //self.monsterCount = count
        //print(endPointData)
        
        for loop in 0...count - 1 {
          print("Starting loop for cellJSONPUll...count from bfore should = 332 and it is...: \(loop)")
          self.cellJSONPull(cellNumber: loop)
          self.monsters.sort {
            $0.index < $1.index
          }
        }
        
        
        print("The Total monster count is \(count)")
        //Get back to the main queue
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      } catch let jsonError {
        print(jsonError)
      }
      }.resume()
    return count
  }
  
  // we'll call this for each row (we must send in the index number {indexPath.row} and output is
  // ** THE problems come from here ***********************    ******************    *******************
  func cellJSONPull(cellNumber: Int) {
    print("Starting cellJSONPull function")
    let index2Num = cellNumber + 1
    
    // BaseURL + monster NAME not number!!!!!
    let urlString = BaseUrl + "\(monsterResults!.results[cellNumber].index)"  // 1st position is 0 but 1st monster index is 1
    print("The wesbite is \(urlString)")
    guard let url = URL(string: urlString) else { return  }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      guard let data = data else { return }
      //Implement JSON decoding and parsing
      do {
        //Decode retrived data with JSONDecoder and assing type of Article object
        let endPointData = try JSONDecoder().decode(MonsterModel.self, from: data)
        print(endPointData)
        print("     *********************************************************************************     ")
        self.monsters.append(endPointData)
        print("Monster count currently is \(self.monsters.count)")
       
        // add to challenge Rating here
        self.assignChallengeRating(monster: endPointData)
        
        // save to core data (this is a loop so only most recent)      **** this is where the PROBLEMS ARE *****
        // self.saveData(aMonster: endPointData) gave weird UI on background thread err messg
        //Get back to the main queue
        DispatchQueue.main.async {
          self.tableView!.reloadData()
          // indicator may need to go here instead
          // saving the monsters to CoreData
//   self.saveData(aMonster: endPointData)
        }
      } catch let jsonError {
        print(jsonError)
      }
      
      }.resume()
    
  }
 
  /*
  func organizeArrayByIndex() {
    for loop in 0...324 {
      if monsters[loop].index != loop + 1 {
        monsters.insert(monsters[loop], at: monsters[loop].index - 1)
      }
    }
    //end of loop
  }  */
  
  // this is assigning before we organize monster array before index#
  func assignChallengeRating(monster: MonsterModel) {
    if (monster.challengeRating < 1.0) && (monster.challengeRating >= 0.0) {
      challengeRatingArray0.append(monster)
      print("*****    Monster assigned to (1st) challenge Rating 0  *******")
      challengeRatingArrayCount += 1
    } else {
      switch monster.challengeRating  {
        case 1.0:
          challengeRatingArray1.append(monster)
          print("*****    Monster assigned to challenge Rating 1  *******")
          challengeRatingArrayCount += 1
        case 2.0:
          challengeRatingArray2.append(monster)
          print("*****    Monster assigned to challenge Rating 2  *******")
          challengeRatingArrayCount += 1
        case 3.0:
          challengeRatingArray3.append(monster)
          print("*****    Monster assigned to challenge Rating 3  *******")
          challengeRatingArrayCount += 1
        case 4.0:
          challengeRatingArray4.append(monster)
          print("*****    Monster assigned to challenge Rating 4  *******")
          challengeRatingArrayCount += 1
        case 5.0:
          challengeRatingArray5.append(monster)
          print("*****    Monster assigned to challenge Rating 5  *******")
          challengeRatingArrayCount += 1
        case 6.0:
          challengeRatingArray6.append(monster)
          print("*****    Monster assigned to challenge Rating 6  *******")
          challengeRatingArrayCount += 1
        case 7.0:
          challengeRatingArray7.append(monster)
          print("*****    Monster assigned to challenge Rating 7  *******")
          challengeRatingArrayCount += 1
        case 8.0:
          challengeRatingArray8.append(monster)
          print("*****    Monster assigned to challenge Rating 8  *******")
          challengeRatingArrayCount += 1
        case 9.0:
          challengeRatingArray9.append(monster)
          print("*****    Monster assigned to challenge Rating 9  *******")
          challengeRatingArrayCount += 1
        case 10.0:
          challengeRatingArray10.append(monster)
          print("*****    Monster assigned to challenge Rating 10  *******")
          challengeRatingArrayCount += 1
        case 11.0:
          challengeRatingArray11.append(monster)
          print("*****    Monster assigned to challenge Rating 11  *******")
          challengeRatingArrayCount += 1
        case 12.0:
          challengeRatingArray12.append(monster)
          print("*****    Monster assigned to challenge Rating 12  *******")
          challengeRatingArrayCount += 1
        case 13.0:
          challengeRatingArray13.append(monster)
          print("*****    Monster assigned to challenge Rating 13  *******")
          challengeRatingArrayCount += 1
        case 14.0:
          challengeRatingArray14.append(monster)
          print("*****    Monster assigned to challenge Rating 14  *******")
          challengeRatingArrayCount += 1
        case 15.0:
          challengeRatingArray15.append(monster)
          print("*****    Monster assigned to challenge Rating 15  *******")
          challengeRatingArrayCount += 1
        case 16.0:
          challengeRatingArray16.append(monster)
          print("*****    Monster assigned to challenge Rating 16  *******")
          challengeRatingArrayCount += 1
        case 17.0:
          challengeRatingArray17.append(monster)
          print("*****    Monster assigned to challenge Rating 17  *******")
          challengeRatingArrayCount += 1
        case 18.0:
          challengeRatingArray18.append(monster)
          print("*****    Monster assigned to challenge Rating 18  *******")
          challengeRatingArrayCount += 1
        case 19.0:
          challengeRatingArray19.append(monster)
          print("*****    Monster assigned to challenge Rating 19  *******")
          challengeRatingArrayCount += 1
        case 20.0:
          challengeRatingArray20.append(monster)
          print("*****    Monster assigned to challenge Rating 20  *******")
          challengeRatingArrayCount += 1
        case 21.0:
          challengeRatingArray21.append(monster)
          print("*****    Monster assigned to challenge Rating 21  *******")
          challengeRatingArrayCount += 1
        case 22.0:
          challengeRatingArray22.append(monster)
          print("*****    Monster assigned to challenge Rating 22  *******")
          challengeRatingArrayCount += 1
        case 23.0:
          challengeRatingArray23.append(monster)
          print("*****    Monster assigned to challenge Rating 23  *******")
          challengeRatingArrayCount += 1
        case 24.0:
          challengeRatingArray24.append(monster)
          print("*****    Monster assigned to challenge Rating 24  *******")
          challengeRatingArrayCount += 1
        case 25.0:
          challengeRatingArray25.append(monster)
          print("*****    Monster assigned to challenge Rating 25  *******")
          challengeRatingArrayCount += 1
        case 26.0:
          challengeRatingArray26.append(monster)
          print("*****    Monster assigned to challenge Rating 26  *******")
          challengeRatingArrayCount += 1
        case 27.0:
          challengeRatingArray27.append(monster)
          print("*****    Monster assigned to challenge Rating 27  *******")
          challengeRatingArrayCount += 1
        case 28.0:
          challengeRatingArray28.append(monster)
          print("*****    Monster assigned to challenge Rating 28  *******")
          challengeRatingArrayCount += 1
        case 29.0:
          challengeRatingArray29.append(monster)
          print("*****    Monster assigned to challenge Rating 29  *******")
          challengeRatingArrayCount += 1
        case 30.0:
          challengeRatingArray30.append(monster)
          print("*****    Monster assigned to challenge Rating 30  *******")
          challengeRatingArrayCount += 1
        default:
          challengeRatingArray0.append(monster)
          print("*****    Monster assigned to (default) challenge Rating 0  *******")
          challengeRatingArrayCount += 1
      }
    } // end of else statement
    
  }
  
/*  func do_table_refresh() {
    DispatchQueue.global(dispatch_get_main_queue()) {
      self.tableView.reloadData()
      return
    })
  } */
  
  // MARK: - Segues
  
  func saveData(aMonster: MonsterModel) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let MonsterMEntity = NSEntityDescription.entity(forEntityName: "MonsterMCoreDataModel", in: context)
    let monsterM1 = NSManagedObject(entity: MonsterMEntity!, insertInto: context)
    
    // Should we be using an array of monsters?
    // *** saving monster model basic attributes
    monsterM1.setValue(aMonster.alignment, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.armorClass, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.challengeRating, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.charisma, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.charismaSave, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.conditionImmunities, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.constitution, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.constitutionSave, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.damageImmunities, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.damageResistances, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.damageVulnerabilities, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.dexterity, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.dexteritySave, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.hitDice, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.hitPoints, forKey: "MonsterMCoreDataModel")
//    monsterM1.setValue(aMonster.id, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.index, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.insight, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.intelligence, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.languages, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.name, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.perception, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.persuasion, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.senses, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.size, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.speed, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.stealth, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.strength, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.subtype, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.type, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.url, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.wisdom, forKey: "MonsterMCoreDataModel")
    monsterM1.setValue(aMonster.wisdomSave, forKey: "MonsterMCoreDataModel")
    
    // save all monsters to {var in ViewController to "forkey" (same var name in CoreData)}
    // *** saving monsters Special abilities (3 attributes to set)
    // aMonster is NOT a NSManagedObject...we need to change this!!!
    let specialAbilities = NSEntityDescription.entity(forEntityName: "SpecialAbilitiesCoreDataModel", in: context)
    let specAbMons = NSManagedObject(entity: specialAbilities!, insertInto: context)
    specAbMons.setValue(aMonster.specialAbilities?.last!.attackBonus, forKey: "SpecialAbilitiesCoreDataModel")
    specAbMons.setValue(aMonster.specialAbilities?.last!.desc, forKey: "SpecialAbilitiesCoreDataModel")
    specAbMons.setValue(aMonster.specialAbilities?.last!.name, forKey: "SpecialAbilitiesCoreDataModel")
    specAbMons.setValue(monsterM1, forKey: "MonsterMCoreDataModel")
    
    // *** saving monsters Actions (5 attributes to set)
    let monsterActions = NSEntityDescription.entity(forEntityName: "ActionsCoreDataModel", in: context)
    let actions = NSManagedObject(entity: monsterActions!, insertInto: context)
    actions.setValue(aMonster.actions?.last!.attackBonus, forKey: "ActionsCoreDataModel")
    actions.setValue(aMonster.actions?.last!.damageBonus, forKey: "ActionsCoreDataModel")
    actions.setValue(aMonster.actions?.last!.attackBonus, forKey: "ActionsCoreDataModel")
    actions.setValue(aMonster.actions?.last!.attackBonus, forKey: "ActionsCoreDataModel")
    actions.setValue(aMonster.actions?.last!.attackBonus, forKey: "ActionsCoreDataModel")
    actions.setValue(monsterM1, forKey: "MonsterMCoreDataModel")
   
    
    // we still need to set actions and special abilities within MonsterMCoreDataModel
    // newEntity.setValue(aMonster, forKey: "MonsterMCoreDataModel")
    // newEntity.setValue(aMonster.actions, forKey: "MonsterMCoreDataModel")
    
    do {
      try context.save()
      monstersSavedOnDisk.append(monsterM1)
      print("saved")
    } catch {
      print("failed saving in the saveData function")
    }
    
  }
  
  func getData() {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MonsterMCoreDataModel")
    request.returnsObjectsAsFaults = false
    do {
      let result = try context.fetch(request)
      for data in result as! [NSManagedObject] {
        monsters = data.value(forKey: "MonsterMCoreDataModel") as! [MonsterModel]
        getDataSuccedded = true
        print("There is data in them der hills")
      }
    } catch {
      print("Failed to fetch the data in the getData functioin call")
      getDataSuccedded = false
    }
  }
  
 
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // *** !!!!PROBlem: this is getting called before func didselectrow
    if segue.destination is ChallengeRatingDetailViewController {
      print("The segue identifier is \(String(describing: segue.identifier))")
      let vc = segue.destination as? ChallengeRatingDetailViewController
      vc?.challengeRatingArray = selectedCRArray
      print("We sending the challenge rating \(selectedCRArray[0].challengeRating) over")
    }
    
    if segue.destination is MonsterDetailViewController {
      print("The segue identifier is \(String(describing: segue.identifier))")
      let vc = segue.destination as? MonsterDetailViewController
      vc!.previousScreenName = screenName
      vc?.monsters.append(chosenDetailMonster!)
    //  print("We sending the challenge rating \(selectedCRArray[0].challengeRating) over")
    }
  }
  
}


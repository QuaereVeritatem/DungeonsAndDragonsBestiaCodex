//
//  MonsterModel.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/5/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

struct MonsterModel: Codable {
  let id: String
  let index: Int
  let name: String
  let size: String
  let type: String
  let subtype: String
  let alignment: String
  let armorClass: Int
  let hitPoints: Int
  let hitDice: String
  let speed: String
  let strength: Int
  let dexterity: Int
  let constitution: Int
  let intelligence: Int
  let wisdom: Int
  let charisma: Int?
  let intelligenceSave: Int?
  let dexteritySave: Int?
  let constitutionSave: Int?
  let wisdomSave: Int?
  let charismaSave: Int?
  let insight: Int?
  let history: Int?
  let perception: Int?
  let persuasion: Int?
  let stealth: Int?
  let damageVulnerabilities: String?
  let damageResistances: String?
  let damageImmunities: String?
  let conditionImmunities: String?
  let senses: String
  let languages: String
  let challengeRating: Float64 // goes up to 30.. so far(Terasque)
  let specialAbilities: [SpecialAbilities]?
  let legendaryActions: [LegendaryActions]?
  let actions:[Actions]?
  let url: String
  
  init(id: String, index: Int, name: String ,size: String ,type: String, subtype: String, alignment: String, armorClass: Int, hitPoints: Int, hitDice: String, speed: String, strength: Int, dexterity: Int, constitution: Int, intelligence: Int, wisdom: Int, charisma: Int?, intelligenceSave: Int?, dexteritySave: Int?, constitutionSave: Int?, wisdomSave: Int?, charismaSave: Int?, insight: Int?, history: Int?, perception: Int?, persuasion: Int?, stealth: Int?, damageVulnerabilities: String?, damageResistances: String?, damageImmunities: String?, conditionImmunities: String?, senses: String, languages: String, challengeRating: Float64, specialAbilities: [SpecialAbilities]?, legendaryActions: [LegendaryActions]?, actions:[Actions]?, url: String){
  self.id = id
  self.index = index
  self.name = name
  self.size = size
  self.type = type
  self.subtype = subtype
  self.alignment = alignment
  self.armorClass = armorClass
  self.hitPoints = hitPoints
  self.hitDice = hitDice
  self.speed = speed
  self.strength = strength
  self.dexterity = dexterity
  self.constitution = constitution
  self.intelligence = intelligence
  self.wisdom = wisdom
  self.charisma = charisma
  self.intelligenceSave = intelligenceSave
  self.dexteritySave = dexteritySave
  self.constitutionSave = constitutionSave
  self.wisdomSave = wisdomSave
  self.charismaSave = charismaSave
  self.insight = insight
  self.history = history
  self.perception = perception
  self.persuasion = persuasion
  self.stealth = stealth
  self.damageVulnerabilities = damageVulnerabilities
  self.damageResistances = damageResistances
  self.damageImmunities = damageImmunities
  self.conditionImmunities = conditionImmunities
  self.senses = senses
  self.languages = languages
  self.challengeRating = challengeRating
  self.specialAbilities = specialAbilities
  self.legendaryActions = legendaryActions
  self.actions = actions
  self.url = url
  }
  enum CodingKeys: String, CodingKey{
    case id = "_id"
    case index = "index"
    case name = "name"
    case size = "size"
    case type = "type"
    case subtype = "subtype"
    case alignment = "alignment"
    case armorClass = "armor_class"
    case hitPoints = "hit_points"
    case hitDice = "hit_dice"
    case speed = "speed"
    case strength = "strength"
    case dexterity = "dexterity"
    case constitution = "constitution"
    case intelligence = "intelligence"
    case wisdom = "wisdom"
    case charisma = "charisma"
    case intelligenceSave = "intelligence_save"
    case dexteritySave = "dexterity_save"
    case constitutionSave = "constitution_save"
    case wisdomSave = "wisdom_save"
    case charismaSave = "charisma_save"
    case insight = "insight"
    case history = "history"
    case perception = "perception"
    case persuasion = "persuasion"
    case stealth = "stealth"
    case damageVulnerabilities = "damage_vulnerabilities"
    case damageResistances = "damage_resistances"
    case damageImmunities = "damage_immunities"
    case conditionImmunities = "condition_immunities"
    case senses = "senses"
    case languages = "languages"
    case challengeRating = "challenge_rating"
    case specialAbilities = "special_abilities"
    case legendaryActions = "legendary_actions"
    case actions = "actions"
    case url = "url"
  }
}

struct SpecialAbilities: Codable {
  let attackBonus: Int
  let desc: String
  let name: String
  
  init(attackBonus: Int, desc: String, name: String) {
    self.attackBonus = attackBonus
    self.desc = desc
    self.name = name
  }
  
  enum CodingKeys: String, CodingKey {
  case attackBonus = "attack_bonus"
  case desc = "desc"
  case name = "name"
  }
}

struct Actions: Codable {
  let attackBonus: Int
  let desc: String
  let name: String
  let damageBonus: Int?
  let damageDice: String?
  
  init(attackBonus: Int, desc: String, name: String, damageBonus: Int?, damageDice: String?){
    self.attackBonus = attackBonus
    self.desc = desc
    self.name = name
    self.damageBonus = damageBonus
    self.damageDice = damageDice
  }
  
  enum CodingKeys: String, CodingKey{
    case attackBonus = "attack_bonus"
    case desc = "desc"
    case name = "name"
    case damageBonus = "damage_bonus"
    case damageDice = "damage_dice"
  }
}

struct LegendaryActions: Codable {
  let attackBonus: Int
  let desc: String
  let name: String
  
  init(attackBonus: Int, desc: String, name: String){
    self.attackBonus = attackBonus
    self.desc = desc
    self.name = name
  }
  
  enum CodingKeys: String, CodingKey{
    case attackBonus = "attack_bonus"
    case desc = "desc"
    case name = "name"
  }
}








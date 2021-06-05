//
//  MonsterResultsModel.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/7/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

struct MonsterResultsModel:Codable {
  let count: Int
  let results: [Results]
  
  init(count: Int, results: [Results]){
    self.count = count
    self.results = results
  }
  
  enum CodingKeys: String, CodingKey {
    case count = "count"
    case results = "results"
  }
}

struct Results: Codable {
  let index: String
  let name: String
  let url: String
  
  init(index: String, name: String, url: String){
    self.index = index
    self.name = name
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case index = "index"
    case name = "name"
    case url = "url"
  }
}

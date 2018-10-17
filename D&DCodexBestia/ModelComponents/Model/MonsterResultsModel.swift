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
  let name: String
  let url: String
  
  init(name: String, url: String){
    self.name = name
    self.url = url
  }
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case url = "url"
  }
}

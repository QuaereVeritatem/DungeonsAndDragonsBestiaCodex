//
//  DataParse.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/7/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//

import Foundation

class DataParse {
  
  // we need to send in data & model type(i.e. MonsterModel or MonsterResultsModel)
  func tryToParseTheData(data: Data, urlUsed: String) {
    do {
      switch urlUsed {
      case "http://www.dnd5eapi.co/api/monsters/":
        let modelForJSON = "MonsterResultsModel"
        parsingNow(modelForJSON: modelForJSON, data: data)
      default:
        let modelForJSON =  "MonsterModel"
        parsingNow(modelForJSON: modelForJSON, data: data)
      }
    }
  }
  
  // pg 48
  func parsingNow(modelForJSON: String, data: Data) {
    //Decode retrived data with JSONDecoder and passing type of model object
    if modelForJSON == "MonsterResultsModel" {
  //    let endPointData = try JSONDecoder().decode(MonsterResultsModel.self, from: data)
    //  print(endPointData)
    } else {
//      let endPointData = try JSONDecoder().decode(MonsterModel.self, from: data)
  //    print(endPointData)
    }
    //Get back to the main queue to do visual work
    DispatchQueue.main.async {
      
      //self.collectionView?.reloadData()
    }
    
    
  }
}

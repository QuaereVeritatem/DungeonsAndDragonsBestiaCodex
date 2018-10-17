//
//  UrlRequest.swift
//  D&DCodexBestia
//
//  Created by Robert Martin on 5/7/18.
//  Copyright © 2018 Robert Martin. All rights reserved.
//
// try to break this down into a urlRequest and a Parser (2 files)

import Foundation

class UrlRequest {
  
  // we need to pass in the BaseUrl(in case we want to use many BaseUrls in the same app)
  func requestForDataFromUrl(UrlToUse: String)  {
    
    let urlString = UrlToUse
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      
      guard let data = data else { return }
      
  //    DataParse.tryToParseTheData(data, UrlToUse)
      //Implement JSON decoding and parsing
  /*    do {
        
        //Decode retrived data with JSONDecoder and assing type of Article object
        let endPointData = try JSONDecoder().decode(User.self, from: data)
        print(endPointData)
        //Get back to the main queue
        DispatchQueue.main.async {
          
          //self.collectionView?.reloadData()
        }
        
      } catch let jsonError {
        print(jsonError)
      }
      
      */
      }.resume()
    return
  }
  
  
}

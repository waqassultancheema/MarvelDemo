//
//  WebAPI.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
import Foundation

typealias onCompletion = (Any?, NetworkError?)->()


protocol WebAPIHandler {
    func getDataFromServer(url: String,completion: @escaping onCompletion)
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

extension WebAPIHandler {
    
    func getDataFromServer(url: String,completion: @escaping onCompletion) {
        
        guard Reachability.isConnectedToNetwork() else {
            completion(nil, NetworkError.noNetwork)
            return
        }
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
      //  Logger.log(message: "URL: \(url)")
        if let urL = URL(string: urlString) {
             let request = URLRequest(url: urL)
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) -> Void in
                ParserURLResponse.parseURLResponse(response: response, data: data, completion: completion)
            }
            task.resume()
        }
       
        
        
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}







//
//  ImageDownloader.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/21/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    
    
    func loadImageWithUrl(_ url: URL,completion: @escaping (Bool) -> ()) {
        
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                completion(true)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let unwrappedData = data {
                if let imageToCache = UIImage(data: unwrappedData) {
                    self.image = imageToCache
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
                }
                completion(true)
            })
        }).resume()
    }
}

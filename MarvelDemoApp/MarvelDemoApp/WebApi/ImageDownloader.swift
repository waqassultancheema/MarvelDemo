//
//  ImageDownloader.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/21/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class ImageDownloader: UIImageView,WebAPIHandler {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String,activityIndictor:UIActivityIndicatorView) {
        
        imageUrlString = urlString
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            DispatchQueue.main.async {
                activityIndictor.stopAnimating()
            }
            return
        }
        getDataFromServer(url: urlString) {[unowned self] (data, error) in
            if error != nil {
                print(error ?? "")
                 DispatchQueue.main.async {
                activityIndictor.stopAnimating()
                }

                return
            }
            
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: data as! Data)
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                if let imageToCac = imageToCache {
                    imageCache.setObject(imageToCac, forKey: urlString as NSString)
                }
                activityIndictor.stopAnimating()
            }
        }
    }
    
}


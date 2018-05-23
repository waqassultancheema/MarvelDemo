//
//  ImageDownloader.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/21/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    static var shared = ImageDownloader()
    private let cache = NSCache<NSString, NSData>()
    
    class func image(for url: URL, completionHandler: @escaping(_ image: UIImage?) -> ()) {
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            
            if let data = ImageDownloader.shared.cache.object(forKey: url.absoluteString as NSString) {
                DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
                return
            }
            
            guard let data = NSData(contentsOf: url) else {
                DispatchQueue.main.async { completionHandler(nil) }
                return
            }
            
            ImageDownloader.shared.cache.setObject(data, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
        }
    }
    
}

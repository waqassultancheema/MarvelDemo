//
//  MovieRemoteApi.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/9/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//



import UIKit


enum SuperHeroList
{
    // MARK: Use cases
    
    enum Fetch
    {
        struct Request
        {
            var isFilteredApplied = false
            var offset:Int = 10
            var limit:Int = 10
            
            var mURL: String {
                if isFilteredApplied == true {
                    let url = String(format:Constant.SUPER_HERO_LIST_URL
                        .path +  "")
                    return url
                } else {
                    let url = String(format: Constant.SUPER_HERO_LIST_URL.path + "&offset=\(offset)" + "&limit=\(limit)")
                    return url
                }
            }
        }
        struct Response: Codable {
            let code: Int
            let status, copyright, attributionText, attributionHTML: String
            let etag: String
            let data: DataClass
            // MARK: Convenience initializers
            init(data: Data) throws {
                self = try JSONDecoder().decode(Response.self, from: data)
            }
            
            init(_ json: String, using encoding: String.Encoding = .utf8) throws {
                guard let data = json.data(using: encoding) else {
                    throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
                }
                try self.init(data: data)
            }
            
            init(fromURL url: URL) throws {
                try self.init(data: try Data(contentsOf: url))
            }
            
            func jsonData() throws -> Data {
                return try JSONEncoder().encode(self)
            }
            
            func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
                return String(data: try self.jsonData(), encoding: encoding)
            }
        }
        
        

        struct ViewModel
        {
            struct DisplayedSuperHero
            {
                var imageString:String
                var name: String
                var image:UIImage
                var superHero:SuperHero
            }
            var displayedSuperHero: [DisplayedSuperHero]
        }
    }
}



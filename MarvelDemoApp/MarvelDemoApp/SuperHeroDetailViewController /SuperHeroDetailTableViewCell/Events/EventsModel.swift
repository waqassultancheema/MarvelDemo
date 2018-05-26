//
//  MovieRemoteApi.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/9/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//



import UIKit


enum EventsModel
{
    // MARK: Use cases
    
    enum Fetch
    {
        struct Request
        {
            var eventURL:String = ""
            var eventID:String = ""
            var mURL: String {
               
            let url = String(format: "\(eventURL)" + "?ts=\(Constant.SUPER_HERO_EVENTS_URL.timeStamp)&apikey=\(Constant.API_KEY)&hash=\(Constant.SUPER_HERO_EVENTS_URL.hash)")
                    return url
            }
            
            var localSaveURL: String {
                let url = String(format: "\(eventID).json")
                return url
            }
        }
        struct Response: Codable {
            let code: Int
            let status, copyright, attributionText, attributionHTML: String
            let etag: String
            let data: DetailDataClass
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
            struct DisplayedEvent
            {
                var name: String
                var detail:String
            }
            var displayedSuperHero: DisplayedEvent
        }
    }
}



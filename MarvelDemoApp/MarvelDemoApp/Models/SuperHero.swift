//
//  Movie.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/1/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

/*                    Models
 We will store all the models related to the controller. The Models class will be related to each component, as you can see in the Flow Diagram. It will be of type struct and mostly it will contain Request, Response, and ViewModel structs.
 For this example, let’s assume you are working with an API call on this scene. You will need the following structs:
 
 Request - parameters that need to be sent to the API request.
 Response - intercepts the response from the API and stores the appropriate data.
 ViewModel - everything that you need to show to the UI is stored here. For example, your API returns objects with 10 parameters, but you only need to show 4 of them.
 */
let APIKey = "44d1c4d4e6c925a008c431d73ae8ff4a"

private var parameters: Dictionary<String, String> = [
    "api_key": APIKey as String,
    "sort_by": "popularity.desc" as String
]

import Foundation




struct SuperHero: Codable {
    let id: Int
    let name, description, modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLs]
}

extension SuperHero {
    init(data: Data) throws {
        self = try JSONDecoder().decode(SuperHero.self, from: data)
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

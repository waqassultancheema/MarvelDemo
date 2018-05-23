//
//  Character.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import Foundation

struct Comics: Codable {
    let available: Int
    let collectionURI: String
    var items: [ComicsItem]
    let returned: Int
}
extension Comics {
    
    init(data: Data) throws {
        self = try JSONDecoder().decode(Comics.self, from: data)
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

//
//  Request.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//


import Foundation


protocol Request {
    func getURLRequest(url: String) -> URLRequest
}

enum RequestType: Request {
    case SuperHeroList
    case SuperHeroSearchList
    case SuperHeroDetail
    
    init(type: RequestType) {
        self = type
    }
    
    func getURLRequest(url: String) -> URLRequest {
        
        switch self {
        case .SuperHeroList:
            return URLRequest(url: URL(string: url)!)
        case .SuperHeroSearchList:
            return URLRequest(url: URL(string: url)!)
        case .SuperHeroDetail:
            return URLRequest(url: URL(string: url)!)
        }
    }
}

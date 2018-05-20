//
//  NetworkError.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import Foundation


enum NetworkError: Error {
    case noNetwork
    case serverError(String)
    case parsingError(String)
    case unknown(String)
}

extension NetworkError: LocalizedError {
    
    var localizedDescription : String {
        
        switch self {
        case .noNetwork:
            return "Please check you are connected to internet."
        case .serverError(let error):
            return error
        case .parsingError(let error):
            return error
        case .unknown(let url):
            return url
        }
    }
}

//
//  Constants.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/20/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

enum Constant {
    case SUPER_HERO_LIST_URL
    case SUPER_HERO_COMICS_URL
    case SUPER_HERO_EVENTS_URL
    case SUPER_HERO_STORIES_URL
    case SUPER_HERO_SERIES_URL

    static let BASE_URL = "https://gateway.marvel.com/v1/public"
    static let API_KEY = "4e58a69173498255e53a2f700a2ae54a"
    static var IMAGE_URL = ""
    
    static func makeImagePath(url: String) -> String {
        return (Constant.IMAGE_URL + url)
    }
    var hash: String {
        return "e4862dd7fb9ed77558b02711ee240469"
    }
    var timeStamp:String {
        return "1"
    }
    var path: String {
        switch self {
        case .SUPER_HERO_LIST_URL:
            
            return Constant.BASE_URL + "/characters?ts=\(timeStamp)&apikey=\(Constant.API_KEY)&hash=\(hash)"
            
        case .SUPER_HERO_COMICS_URL:
            
            return Constant.BASE_URL + "/comics/"
        case .SUPER_HERO_EVENTS_URL:
            
            return Constant.BASE_URL + "/characters?ts=\(timeStamp)&apikey=\(Constant.API_KEY)&hash=\(hash)"
        case .SUPER_HERO_STORIES_URL:
            
            return Constant.BASE_URL + "/characters?ts=\(timeStamp)&apikey=\(Constant.API_KEY)&hash=\(hash)"
        case .SUPER_HERO_SERIES_URL:
            
            return Constant.BASE_URL + "/characters?ts=\(timeStamp)&apikey=\(Constant.API_KEY)&hash=\(hash)"
        }
    }
    
    struct Alert {
        static let title = "Alert"
        static let message = ""
        static let ok = "OK"
        static let cancel = "Cancel"
    }
    struct Parsing {
        static let message = "Json Parsing Error"
        static let unKnown = "UnKnown Error occur, please try again"
    }
//    struct mDate {
//        static let YYYYMMDD_Format = "YYYY-MM-DD"
//    }
    
}

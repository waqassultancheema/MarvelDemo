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
//5AC7FFD29B1FDFF3680137660658F29D
    
    //
    static let BASE_URL = "https://gateway.marvel.com/v1/public"
    static let API_KEY = "4e58a69173498255e53a2f700a2ae54a"
    static let PRIVATE_API_KEY = "f6b2c2f18fcb21c3e41de50636880647bed08c54"
    static var IMAGE_URL = ""

    static func makeImagePath(url: String) -> String {
        return (Constant.IMAGE_URL + url)
    }
 
    var timeStamp:String {
        return String(Date().ticks)
    }
    func makeHash(timeStamp:String) -> String {
        let has = String(timeStamp + Constant.PRIVATE_API_KEY + Constant.API_KEY)
        return has.md5()
    }
    var path: String {
        switch self {
        case .SUPER_HERO_LIST_URL:
            let timeS = timeStamp
            return Constant.BASE_URL + "/characters?ts=\(timeS)&apikey=\(Constant.API_KEY)&hash=\(makeHash(timeStamp: timeS))"
            
        case .SUPER_HERO_COMICS_URL:
            
            return Constant.BASE_URL + "/comics/"
        case .SUPER_HERO_EVENTS_URL:
            let timeS = timeStamp
            return Constant.BASE_URL + "/characters?ts=\(timeS)&apikey=\(Constant.API_KEY)&hash=\(makeHash(timeStamp: timeS))"
        case .SUPER_HERO_STORIES_URL:
            let timeS = timeStamp
            return Constant.BASE_URL + "/characters?ts=\(timeS)&apikey=\(Constant.API_KEY)&hash=\(makeHash(timeStamp: timeS))"
        case .SUPER_HERO_SERIES_URL:
            let timeS = timeStamp

            return Constant.BASE_URL + "/characters?ts=\(timeS)&apikey=\(Constant.API_KEY)&hash=\(makeHash(timeStamp: timeS))"
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
// https://stackoverflow.com/questions/32163848/how-to-convert-string-to-md5-hash-using-ios-swift
extension String {
    func md5() -> String! {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate(capacity: 1)
        var hexString = ""
        for byte in digest {
            hexString += String(format:"%02x", byte)
        }
        
        return hexString
    }

}


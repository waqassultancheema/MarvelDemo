
//
//  Helper.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/24/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit



class SaveFavourite {
  class  func saveFavouriteSelection(idOfSuperHero:Int) {
        UserDefaults.standard.setValue("true", forKey: "\(idOfSuperHero)")
    }
   class func removeFavouriteSelection(idOfSuperHero:Int) {
        UserDefaults.standard.removeObject(forKey:"\(idOfSuperHero)" )
    }
  class  func fetchFavouriteSelection(idOfSuperHero:Int) ->Bool {
        if let value = UserDefaults.standard.object(forKey: "\(idOfSuperHero)") {
            if value as! String == "true" {
                return true
            }
        }
        return false
    }
}


// Swift 3:  https://stackoverflow.com/questions/39829831/how-to-get-18-digit-current-timestamp-in-swift/39830091?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
extension Date {
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
}

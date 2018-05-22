//
//  SuperHeroDetailDataSource.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/21/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class SuperHeroDetailDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var displaySuperHero:SuperHeroList.Fetch.ViewModel.DisplayedSuperHero?
    var isLoadingList:Bool = false
    public var loadMoreSuperHerosForList: (() -> Void)?
    var index = 0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let tableViewCell:SuperHeroListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroListTableViewCell", for: indexPath) as! SuperHeroListTableViewCell
                tableViewCell.headerLabel.text = displaySuperHero?.name
                tableViewCell.downloadImage(url: (displaySuperHero?.imageString)!)
                return tableViewCell
            }
        } else if indexPath.section == 1 {
           
            
                let tableViewCell:SuperHeroDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroDetailTableViewCell", for: indexPath) as! SuperHeroDetailTableViewCell
            if index < (displaySuperHero?.superHero.comics.items.count)! {
                tableViewCell.activityIndictor.stopAnimating()
                tableViewCell.headerLabel.text = displaySuperHero?.superHero.comics.items[index].name
                tableViewCell.comicURL  = (displaySuperHero?.superHero.comics.items[index].resourceURI)!
                tableViewCell.request =  ComicsModel.Fetch.Request(comicURL: tableViewCell.comicURL)
                tableViewCell.sendServiceRequest()
                index  = index + 1
            }
            
                return tableViewCell
            
        }
        
        let tableViewCell:SuperHeroDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroDetailTableViewCell", for: indexPath) as! SuperHeroDetailTableViewCell
      //  tableViewCell.headerLabel.text = displaySuperHero?.superHero.comics.items[index].name
       // tableViewCell.comicURL  = (displaySuperHero?.superHero.comics.items[index].resourceURI)!
        return tableViewCell
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        if section == 1 {
            return "Comics"
        } else if section == 2 {
            return "Event"
        } else if section == 3 {
            return "Stories"
        } else if section == 4 {
            return "Series"
        }
         return "Super Hero"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if displaySuperHero != nil {
            if section == 1 {
                if let comicArray = displaySuperHero?.superHero.comics.items {
                    if comicArray.count > 0 {
                        return 3 //TODO : When i set it 3 or 2.. problem come.. plz chk
                    }
                }
            } else {
                return 1
            }
            
            
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
}

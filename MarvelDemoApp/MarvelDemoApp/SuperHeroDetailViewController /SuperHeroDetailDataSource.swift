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
                tableViewCell.idOfSuperHero = displaySuperHero?.superHero.id ?? 0
                tableViewCell.favButton.isSelected = SaveFavourite.fetchFavouriteSelection(idOfSuperHero: displaySuperHero?.superHero.id ?? 0)
                return tableViewCell
            }
        } else if indexPath.section == 1 {
           
            
                let tableViewCell:SuperHeroDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroDetailTableViewCell", for: indexPath) as! SuperHeroDetailTableViewCell
                tableViewCell.configureCellWithCellType(cellType: .Comic)
                tableViewCell.activityIndictor.stopAnimating()
                tableViewCell.headerLabel.text = displaySuperHero?.superHero.comics.items[indexPath.row].name
            if let comicItem = (displaySuperHero?.superHero.comics.items[indexPath.row]) {
                tableViewCell.requestComic = ComicsModel.Fetch.Request(comicURL: comicItem.resourceURI, eventID: comicItem.name)
            }
               tableViewCell.sendComicServiceRequest()
            
            
                return tableViewCell
            
        } else if indexPath.section == 2 {
            
            
            let tableViewCell:SuperHeroDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroDetailTableViewCell", for: indexPath) as! SuperHeroDetailTableViewCell
            tableViewCell.configureCellWithCellType(cellType: .Event)
            tableViewCell.activityIndictor.stopAnimating()
            tableViewCell.headerLabel.text = displaySuperHero?.superHero.events.items[indexPath.row].name
            if let comicItem = (displaySuperHero?.superHero.events.items[indexPath.row]) {
                tableViewCell.requestEvent =  EventsModel.Fetch.Request(eventURL: comicItem.resourceURI, eventID: comicItem.name)

            }
            tableViewCell.sendEventServiceRequest()
            
            
            return tableViewCell
            
        } else if indexPath.section == 3 {
            
            
            let tableViewCell:SuperHeroDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroDetailTableViewCell", for: indexPath) as! SuperHeroDetailTableViewCell
            tableViewCell.configureCellWithCellType(cellType: .Story)
            tableViewCell.activityIndictor.stopAnimating()
            tableViewCell.headerLabel.text = displaySuperHero?.superHero.stories.items[indexPath.row].name
            if let storiesItem = (displaySuperHero?.superHero.stories.items[indexPath.row]) {
                tableViewCell.requestStories =  StoriesModel.Fetch.Request(storiesURL: storiesItem.resourceURI, eventID: storiesItem.name)
                
            }

            tableViewCell.sendStoriesServiceRequest()
            
            
            return tableViewCell
            
        } else if indexPath.section == 4 {
            
            
            let tableViewCell:SuperHeroDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroDetailTableViewCell", for: indexPath) as! SuperHeroDetailTableViewCell
            tableViewCell.configureCellWithCellType(cellType: .Series)
            tableViewCell.activityIndictor.stopAnimating()
            tableViewCell.headerLabel.text = displaySuperHero?.superHero.series.items[indexPath.row].name
            if let seriesitem = (displaySuperHero?.superHero.series.items[indexPath.row]) {
                tableViewCell.requestSeries =  SeriesModel.Fetch.Request(seriesURL: seriesitem.resourceURI, eventID: seriesitem.name)
                
            }

            tableViewCell.sendSeriesServiceRequest()
            
            
            return tableViewCell
            
        }
        
        let tableViewCell:SuperHeroDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroDetailTableViewCell", for: indexPath) as! SuperHeroDetailTableViewCell
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
                        return comicArray.count
                    }
                }
            } else if section == 2 {
                if let comicArray = displaySuperHero?.superHero.events.items {
                    if comicArray.count > 0 {
                        return comicArray.count
                    }
                }
            } else if section == 3 {
                if let comicArray = displaySuperHero?.superHero.stories.items {
                    if comicArray.count > 0 {
                        return comicArray.count
                    }
                }
            } else if section == 4 {
                if let comicArray = displaySuperHero?.superHero.series.items {
                    if comicArray.count > 0 {
                        return comicArray.count
                    }
                }
            }
            else {
                return 1
            }
            
            
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 200
        }
        return 300
        
    }
    
    
    
}

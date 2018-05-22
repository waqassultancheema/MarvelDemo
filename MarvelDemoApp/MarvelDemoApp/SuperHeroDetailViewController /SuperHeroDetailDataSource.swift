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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell:SuperHeroListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroListTableViewCell", for: indexPath) as! SuperHeroListTableViewCell
        tableViewCell.headerLabel.text = displaySuperHero?.name
        tableViewCell.downloadImage(url: (displaySuperHero?.imageString)!)
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if displaySuperHero != nil {
            return 1
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
}

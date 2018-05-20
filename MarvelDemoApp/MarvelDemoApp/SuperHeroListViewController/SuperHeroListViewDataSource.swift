//
//  SuperHeroListViewDataSource.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/14/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class SuperHeroListViewDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var displaySuperHeros:[SuperHeroList.Fetch.ViewModel.DisplayedSuperHero] = []
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell:SuperHeroListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroListTableViewCell", for: indexPath) as! SuperHeroListTableViewCell
        let displaySuperHero:SuperHeroList.Fetch.ViewModel.DisplayedSuperHero = displaySuperHeros[indexPath.row]
        tableViewCell.headerLabel.text = displaySuperHero.name
        tableViewCell.downloadImage(url: displaySuperHero.image)
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displaySuperHeros.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

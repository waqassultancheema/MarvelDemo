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
    var isLoadingList:Bool = false
    public var loadMoreSuperHerosForList: (() -> ())?
    public var superHeroSelected: ((SuperHeroList.Fetch.ViewModel.DisplayedSuperHero) -> ())?

    
    func loadTableViewFromData(){
        isLoadingList = false
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell:SuperHeroListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroListTableViewCell", for: indexPath) as! SuperHeroListTableViewCell
        let displaySuperHero:SuperHeroList.Fetch.ViewModel.DisplayedSuperHero = displaySuperHeros[indexPath.row]
        tableViewCell.headerLabel.text = displaySuperHero.name
        tableViewCell.downloadImage(url: displaySuperHero.imageString)
        
        
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displaySuperHeros.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displaySuperHero:SuperHeroList.Fetch.ViewModel.DisplayedSuperHero = displaySuperHeros[indexPath.row]
        self.superHeroSelected!(displaySuperHero)
    }
    
   

}

extension SuperHeroListViewDataSource : UIScrollViewDelegate {
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList){
            self.isLoadingList = true
            self.loadMoreSuperHerosForList!()
        }
    }
}

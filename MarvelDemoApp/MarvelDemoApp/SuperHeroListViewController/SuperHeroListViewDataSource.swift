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
        tableViewCell.idOfSuperHero = displaySuperHero.superHero.id
        tableViewCell.favButton.isSelected = SaveFavourite.fetchFavouriteSelection(idOfSuperHero: displaySuperHero.superHero.id)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            tableView.tableFooterView = spinner
            tableView.tableFooterView?.isHidden = false
        }
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


//
//  MovieConfigurator.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/14/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

extension SuperHeroListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.prepare(for: segue, sender: sender)
    }
    func fetchMoreItemsFromServer(){
        
        
        self.tableViewDataSource.loadMoreSuperHerosForList = { [unowned self] in
            DispatchQueue.main.async() {
                self.activityIndictor.startAnimating()
            }
            self.offset = self.offset + 20
            let request = SuperHeroList.Fetch.Request(isFilteredApplied: false, offset: self.offset, limit: 20)
            self.output.fetchItems(request: request)
        }
    }
    
    func handleTableViewSelection() {
        self.tableViewDataSource.superHeroSelected = { [unowned self] (superHero) in
            self.router.showSuperHeroDetailViewController(superHero: superHero)
        }
    }
}
extension SuperHeroListViewController: SuperHeroPresenterOutput
{
    func successFetchedItems(viewModel: [SuperHeroList.Fetch.ViewModel.DisplayedSuperHero]) {
        self.tableViewDataSource.displaySuperHeros.append(contentsOf: viewModel)
        
        DispatchQueue.main.async() {
            self.activityIndictor.stopAnimating()
            self.tableViewDataSource.loadTableViewFromData()
            self.tableView.reloadData()
        }
        
    }
    
    func errorFetchingItems(viewModel: [SuperHeroList.Fetch.ViewModel.DisplayedSuperHero]) {
        
    }
    
    
}

extension SuperHeroInteractor: SuperHeroListViewControllerOutput
{
    func fetchItems(request: SuperHeroList.Fetch.Request) {
          SuperHeroConfigurator.sharedInstance.interactor.fetchSuperHeros(request: request)
    }
    
    
}

extension  SuperHeroPresenter: SuperHeroInteractorOutput
{
    func presentFetchedSuperHeros(response: SuperHeroList.Fetch.Response) {
        SuperHeroConfigurator.sharedInstance.presenter.presentFetchResults(response: response)
    }
}

class SuperHeroConfigurator: NSObject {

    static let sharedInstance = SuperHeroConfigurator()
    let presenter = SuperHeroPresenter()
    let interactor = SuperHeroInteractor()
    let router = SuperHeroListRouter()

    private override init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: SuperHeroListViewController)
    {
        router.superHeroListViewController = viewController
        presenter.output = viewController
        
      
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}

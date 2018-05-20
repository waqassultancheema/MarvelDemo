//
//  MovieConfigurator.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/14/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

extension SuperHeroListViewController: SuperHeroPresenterOutput
{
    func successFetchedItems(viewModel: [SuperHeroList.Fetch.ViewModel.DisplayedSuperHero]) {
        self.tableViewDataSource.displaySuperHeros = viewModel
        DispatchQueue.main.async() {
            self.tableView.reloadData()
        }
        
    }
    
    func errorFetchingItems(viewModel: [SuperHeroList.Fetch.ViewModel.DisplayedSuperHero]) {
        
    }
    
//    func successFetchedItems(viewModel: [Fetch.ViewModel.DisplayViewModel]) {
//        //self.viewModels = viewModel
//        self.tableViewDataSource.displayMovies = viewModel
//        self.tableView.reloadData()
//
//    }
//
//    func errorFetchingItems(viewModel: [Fetch.ViewModel.DisplayViewModel]) {
//      //  self.viewModels = viewModel
//        self.tableViewDataSource.displayMovies = viewModel
//        self.tableView.reloadData()
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // open next view controller from here
       // router.passDataToNextScene(segue: segue)
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
    
//    func presentFetchMovies(movies: [Movie]) {
//        SuperHeroConfigurator.sharedInstance.presenter.presentFetchResults(movies: movies)
//    }
}

class SuperHeroConfigurator: NSObject {

    static let sharedInstance = SuperHeroConfigurator()
    let presenter = SuperHeroPresenter()
    let interactor = SuperHeroInteractor()
    let router = MarvelAppRouter()

    private override init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: SuperHeroListViewController)
    {
        router.movieListViewController = viewController
        
       
        presenter.output = viewController
        
      
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}

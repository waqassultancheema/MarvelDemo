//
//  ComicConfigurator.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/22/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit




extension SuperHeroDetailTableViewCell {
    
}
extension SuperHeroDetailTableViewCell: ComicsPresenterOutput
{
    func successFetchedItems(viewModel: ComicsModel.Fetch.ViewModel.DisplayedComic) {
        DispatchQueue.main.async() {
            self.activityIndictor.stopAnimating()
            self.headerLabel.text = viewModel.name
            self.descriptionLabel.text = viewModel.detail.count > 0 ? viewModel.detail : "No Description Found"
        }
      
        
    }
    
    func errorFetchingItems(viewModel: ComicsModel.Fetch.ViewModel.DisplayedComic) {
        
    }
    
    func sendComicServiceRequest() {
        // Initialization code
        self.activityIndictor.startAnimating()
        output.fetchComicItems(request: requestComic!)
    }
    
    
    
}

extension ComicsInteractor: SuperHeroDetailTableViewCellOutput
{
    func fetchComicItems(request: ComicsModel.Fetch.Request) {
        self.fetchComic(request: request)

    }
    
    func fetchEventItems(request: EventsModel.Fetch.Request) {
        
    }
    
    func fetchStoriesItems(request: StoriesModel.Fetch.Request) {
        
    }
    
    func fetchSeriesItems(request: SeriesModel.Fetch.Request) {
        
    }
    
   
    
    
    
    
}

extension  ComicsPresenter: ComicsInteractorOutput
{
    func presentFetchedComic(response: ComicsModel.Fetch.Response) {
        self.presentFetchResults(response: response)
    }
    
}

class ComicConfigurator: NSObject {
    
  //  static let sharedInstance = ComicConfigurator()
    let presenter = ComicsPresenter()
    let interactor = ComicsInteractor()
    
    override init() {}
    
    // MARK: - Configuration
    
    func configure(cell: SuperHeroDetailTableViewCell)
    {
        presenter.output = cell
        interactor.output = presenter
        cell.output = interactor
    }
}

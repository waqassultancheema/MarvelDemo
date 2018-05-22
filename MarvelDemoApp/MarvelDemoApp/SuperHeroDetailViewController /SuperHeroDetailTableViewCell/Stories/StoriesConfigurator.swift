//
//  StoriesConfigurator.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/22/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit




extension SuperHeroDetailTableViewCell {
    
}
extension SuperHeroDetailTableViewCell: StoriesPresenterOutput
{
    func successFetchedItems(viewModel: StoriesModel.Fetch.ViewModel.DisplayedStories) {
        DispatchQueue.main.async() {
            self.activityIndictor.stopAnimating()
            self.headerLabel.text = viewModel.name
            self.descriptionLabel.text = viewModel.detail
        }
      
        
    }
    
    func errorFetchingItems(viewModel: StoriesModel.Fetch.ViewModel.DisplayedStories) {
        
    }
    
    func sendStoriesServiceRequest() {
        // Initialization code
        self.activityIndictor.startAnimating()
        output.fetchStoriesItems(request: requestStories!)
    }
    
    
    
}

extension StoriesInteractor: SuperHeroDetailTableViewCellOutput
{
    func fetchComicItems(request: ComicsModel.Fetch.Request) {
        
    }
    
    func fetchEventItems(request: EventsModel.Fetch.Request) {
        
    }
    
    func fetchStoriesItems(request: StoriesModel.Fetch.Request) {
        self.fetchStories(request: request)

    }
    
    func fetchSeriesItems(request: SeriesModel.Fetch.Request) {
        
    }
    
   
    
    
    
    
}

extension  StoriesPresenter: StoriesInteractorOutput
{
    
    
    func presentFetchedStories(response: StoriesModel.Fetch.Response) {
        self.presentFetchResults(response: response)
    }
    
}

class StoriesConfigurator: NSObject {
    
  //  static let sharedInstance = StoriesConfigurator()
    let presenter = StoriesPresenter()
    let interactor = StoriesInteractor()
    
    override init() {}
    
    // MARK: - Configuration
    
    func configure(cell: SuperHeroDetailTableViewCell)
    {
        presenter.output = cell
        interactor.output = presenter
        cell.output = interactor
    }
}

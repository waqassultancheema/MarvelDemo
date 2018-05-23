//
//  EventConfigurator.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/22/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit




extension SuperHeroDetailTableViewCell {
    
}
extension SuperHeroDetailTableViewCell: EventsPresenterOutput
{
    func successFetchedItems(viewModel: EventsModel.Fetch.ViewModel.DisplayedEvent) {
        DispatchQueue.main.async() {
            self.activityIndictor.stopAnimating()
            self.headerLabel.text = viewModel.name
            self.descriptionLabel.text =  viewModel.detail.count > 0 ? viewModel.detail : "No Description Found"
        }
      
        
    }
    
    func errorFetchingItems(viewModel: EventsModel.Fetch.ViewModel.DisplayedEvent) {
        
    }
    
    func sendEventServiceRequest() {
        // Initialization code
        self.activityIndictor.startAnimating()
        output.fetchEventItems(request: requestEvent!)
    }
    
    
    
}

extension EventsInteractor: SuperHeroDetailTableViewCellOutput
{
    func fetchComicItems(request: ComicsModel.Fetch.Request) {
        
    }
    
    func fetchEventItems(request: EventsModel.Fetch.Request) {
        self.fetchEvent(request: request)

    }
    
    func fetchStoriesItems(request: StoriesModel.Fetch.Request) {
        
    }
    
    func fetchSeriesItems(request: SeriesModel.Fetch.Request) {
        
    }
}

extension  EventsPresenter: EventsInteractorOutput
{
    func presentFetchedEvent(response: EventsModel.Fetch.Response) {
        self.presentFetchResults(response: response)
    }
    
}

class EventConfigurator: NSObject {
    
  //  static let sharedInstance = EventConfigurator()
    let presenter = EventsPresenter()
    let interactor = EventsInteractor()
    
    override init() {}
    
    // MARK: - Configuration
    
    func configure(cell: SuperHeroDetailTableViewCell)
    {
        presenter.output = cell
        interactor.output = presenter
        cell.output = interactor
    }
}

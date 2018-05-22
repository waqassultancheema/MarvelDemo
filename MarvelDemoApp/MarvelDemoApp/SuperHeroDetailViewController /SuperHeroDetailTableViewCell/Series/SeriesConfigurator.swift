//
//  SeriesConfigurator.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/22/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit




extension SuperHeroDetailTableViewCell {
    
}
extension SuperHeroDetailTableViewCell: SeriesPresenterOutput
{
    func successFetchedItems(viewModel: SeriesModel.Fetch.ViewModel.DisplayedSeries) {
        DispatchQueue.main.async() {
            self.activityIndictor.stopAnimating()
            self.headerLabel.text = viewModel.name
            self.descriptionLabel.text = viewModel.detail
        }
      
        
    }
    
    func errorFetchingItems(viewModel: SeriesModel.Fetch.ViewModel.DisplayedSeries) {
        
    }
    
    func sendSeriesServiceRequest() {
        // Initialization code
        self.activityIndictor.startAnimating()
        output.fetchSeriesItems(request: requestSeries!)
    }
    
    
    
}

extension SeriesInteractor: SuperHeroDetailTableViewCellOutput
{
    func fetchComicItems(request: ComicsModel.Fetch.Request) {
        
    }
    
    func fetchEventItems(request: EventsModel.Fetch.Request) {
        
    }
    
    func fetchStoriesItems(request: StoriesModel.Fetch.Request) {
        
    }
    
    func fetchSeriesItems(request: SeriesModel.Fetch.Request) {
        self.fetchSeries(request: request)

    }
    

    
    
    
    
}

extension  SeriesPresenter: SeriesInteractorOutput
{
    func presentFetchedSeries(response: SeriesModel.Fetch.Response) {
        self.presentFetchResults(response: response)
    }
    
}

class SeriesConfigurator: NSObject {
    
  //  static let sharedInstance = SeriesConfigurator()
    let presenter = SeriesPresenter()
    let interactor = SeriesInteractor()
    
    override init() {}
    
    // MARK: - Configuration
    
    func configure(cell: SuperHeroDetailTableViewCell)
    {
        presenter.output = cell
        interactor.output = presenter
        cell.output = interactor
    }
}

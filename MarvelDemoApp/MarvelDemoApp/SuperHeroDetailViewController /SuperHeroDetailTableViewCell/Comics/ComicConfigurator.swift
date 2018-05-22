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
            self.descriptionLabel.text = viewModel.detail
        }
      
        
    }
    
    func errorFetchingItems(viewModel: ComicsModel.Fetch.ViewModel.DisplayedComic) {
        
    }
    
    func sendServiceRequest() {
        // Initialization code
        self.activityIndictor.startAnimating()
        output.fetchItems(request: request!)
    }
    
    
    
}

extension ComicsInteractor: SuperHeroDetailTableViewCellOutput
{
    func fetchItems(request: ComicsModel.Fetch.Request) {
        ComicConfigurator.sharedInstance.interactor.fetchComic(request: request)
    }
    
    
    
    
}

extension  ComicsPresenter: ComicsInteractorOutput
{
    func presentFetchedComic(response: ComicsModel.Fetch.Response) {
        ComicConfigurator.sharedInstance.presenter.presentFetchResults(response: response)
    }
    
}

class ComicConfigurator: NSObject {
    
    static let sharedInstance = ComicConfigurator()
    let presenter = ComicsPresenter()
    let interactor = ComicsInteractor()
    
    private override init() {}
    
    // MARK: - Configuration
    
    func configure(cell: SuperHeroDetailTableViewCell)
    {
        presenter.output = cell
        interactor.output = presenter
        cell.output = interactor
    }
}

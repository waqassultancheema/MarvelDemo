//
//  ComicsPresenter.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

/*                             Presenter
      Now that we have the Response from the Interactor, it’s time to format it into a ViewModel and pass the result back to the ViewController. Presenter will be in charge for the presentation logic. This component decides how the data will be presented to the user. In the presentFetchResults() function you can see that I am handling 2 delegate methods. (1) handling success situation, (2) handling error situation.*/
import UIKit
protocol ComicsPresenterInput
{
    func presentFetchResults(response:ComicsModel.Fetch.Response);
}

protocol ComicsPresenterOutput: class
{
    func successFetchedItems(viewModel: ComicsModel.Fetch.ViewModel.DisplayedComic)
    func errorFetchingItems(viewModel: ComicsModel.Fetch.ViewModel.DisplayedComic)
}
class ComicsPresenter:ComicsPresenterInput {

    var output:ComicsPresenterOutput!
    
    
    func presentFetchResults(response:ComicsModel.Fetch.Response) {
        
//        if response == nil {
//            output.errorFetchingItems(viewModel: [])
//        }
        
        let displayViewModel = ComicsModel.Fetch.ViewModel.DisplayedComic(name: (response.data.results.first?.title)!, detail: (response.data.results.first?.description)!)
        output.successFetchedItems(viewModel: displayViewModel)
    }
}

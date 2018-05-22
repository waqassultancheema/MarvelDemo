//
//  SeriesPresenter.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

/*                             Presenter
      Now that we have the Response from the Interactor, it’s time to format it into a ViewModel and pass the result back to the ViewController. Presenter will be in charge for the presentation logic. This component decides how the data will be presented to the user. In the presentFetchResults() function you can see that I am handling 2 delegate methods. (1) handling success situation, (2) handling error situation.*/
import UIKit
protocol SeriesPresenterInput
{
    func presentFetchResults(response:SeriesModel.Fetch.Response);
}

protocol SeriesPresenterOutput: class
{
    func successFetchedItems(viewModel: SeriesModel.Fetch.ViewModel.DisplayedSeries)
    func errorFetchingItems(viewModel: SeriesModel.Fetch.ViewModel.DisplayedSeries)
}
class SeriesPresenter:SeriesPresenterInput {

    var output:SeriesPresenterOutput!
    
    
    func presentFetchResults(response:SeriesModel.Fetch.Response) {
        
//        if response == nil {
//            output.errorFetchingItems(viewModel: [])
//        }
        if let seriesModels =  response.data.results.first {
            let displayViewModel = SeriesModel.Fetch.ViewModel.DisplayedSeries(name: seriesModels.title , detail: seriesModels.description ?? "")
            output.successFetchedItems(viewModel: displayViewModel)
        }
        
    }
}

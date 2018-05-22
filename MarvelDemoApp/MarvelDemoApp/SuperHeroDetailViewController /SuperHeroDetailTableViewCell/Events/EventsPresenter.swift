//
//  EventsPresenter.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

/*                             Presenter
      Now that we have the Response from the Interactor, it’s time to format it into a ViewModel and pass the result back to the ViewController. Presenter will be in charge for the presentation logic. This component decides how the data will be presented to the user. In the presentFetchResults() function you can see that I am handling 2 delegate methods. (1) handling success situation, (2) handling error situation.*/
import UIKit
protocol EventsPresenterInput
{
    func presentFetchResults(response:EventsModel.Fetch.Response);
}

protocol EventsPresenterOutput: class
{
    func successFetchedItems(viewModel: EventsModel.Fetch.ViewModel.DisplayedEvent)
    func errorFetchingItems(viewModel: EventsModel.Fetch.ViewModel.DisplayedEvent)
}
class EventsPresenter:EventsPresenterInput {

    var output:EventsPresenterOutput!
    
    
    func presentFetchResults(response:EventsModel.Fetch.Response) {
        
//        if response == nil {
//            output.errorFetchingItems(viewModel: [])
//        }
        if let eventModels =  response.data.results.first {
            let displayViewModel = EventsModel.Fetch.ViewModel.DisplayedEvent(name: eventModels.title , detail: eventModels.description ?? "")
            output.successFetchedItems(viewModel: displayViewModel)
        }
        
    }
}

//
//  StoriesPresenter.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

/*                             Presenter
      Now that we have the Response from the Interactor, it’s time to format it into a ViewModel and pass the result back to the ViewController. Presenter will be in charge for the presentation logic. This component decides how the data will be presented to the user. In the presentFetchResults() function you can see that I am handling 2 delegate methods. (1) handling success situation, (2) handling error situation.*/
import UIKit
protocol StoriesPresenterInput
{
    func presentFetchResults(response:StoriesModel.Fetch.Response);
}

protocol StoriesPresenterOutput: class
{
    func successFetchedItems(viewModel: StoriesModel.Fetch.ViewModel.DisplayedStories)
    func errorFetchingItems(viewModel: StoriesModel.Fetch.ViewModel.DisplayedStories)
}
class StoriesPresenter:StoriesPresenterInput {

    var output:StoriesPresenterOutput!
    
    
    func presentFetchResults(response:StoriesModel.Fetch.Response) {
        
//        if response == nil {
//            output.errorFetchingItems(viewModel: [])
//        }
        if let storiesModels =  response.data.results.first {
            let displayViewModel = StoriesModel.Fetch.ViewModel.DisplayedStories(name: storiesModels.title , detail: storiesModels.description ?? "")
            output.successFetchedItems(viewModel: displayViewModel)
        }
        
    }
}

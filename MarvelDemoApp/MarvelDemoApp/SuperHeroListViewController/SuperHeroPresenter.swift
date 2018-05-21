//
//  SuperHeroPresenter.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

/*                             Presenter
      Now that we have the Response from the Interactor, it’s time to format it into a ViewModel and pass the result back to the ViewController. Presenter will be in charge for the presentation logic. This component decides how the data will be presented to the user. In the presentFetchResults() function you can see that I am handling 2 delegate methods. (1) handling success situation, (2) handling error situation.*/
import UIKit
protocol SuperHeroPresenterInput
{
    func presentFetchResults(response:SuperHeroList.Fetch.Response);
}

protocol SuperHeroPresenterOutput: class
{
    func successFetchedItems(viewModel: [SuperHeroList.Fetch.ViewModel.DisplayedSuperHero])
    func errorFetchingItems(viewModel: [SuperHeroList.Fetch.ViewModel.DisplayedSuperHero])
}
class SuperHeroPresenter:SuperHeroPresenterInput {

    var output:SuperHeroPresenterOutput!
    
    
    func presentFetchResults(response:SuperHeroList.Fetch.Response) {
        
//        if response == nil {
//            output.errorFetchingItems(viewModel: [])
//        }
        var displayMovies:[SuperHeroList.Fetch.ViewModel.DisplayedSuperHero] = []
        for superHero in response.data.results {
            let displayViewModel = SuperHeroList.Fetch.ViewModel.DisplayedSuperHero(imageString: superHero.thumbnail.path + ".\(superHero.thumbnail.thumbnailExtension)", name: superHero.name, image: #imageLiteral(resourceName: "image_not_available"))
            displayMovies.append(displayViewModel)
        }
        output.successFetchedItems(viewModel: displayMovies)
    }
}

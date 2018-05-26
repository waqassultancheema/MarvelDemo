//
//  SuperHeroInteractor.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                  Interactor
   This is the “mediator” between the Worker and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the Worker. Before proceeding to the Worker, a validation is done to check if everything is sent properly. If everything is ok, the Worker returns a response and the Interactor passes that response towards the Presenter. */
protocol SuperHeroInteractorInput {

    func fetchSuperHeros(request:SuperHeroList.Fetch.Request)
}

protocol SuperHeroInteractorOutput {
    func presentFetchedSuperHeros(response:SuperHeroList.Fetch.Response)

}
class SuperHeroInteractor:SuperHeroInteractorInput {

    var output: SuperHeroInteractorOutput!
    var worker: SuperHeroRemoteWorker!
    
    func fetchSuperHeros(request: SuperHeroList.Fetch.Request) {
        
//        if request.parameters.count  == 0  {
//           self.output.presentfetchData(movies: [])
//        }
        worker = SuperHeroRemoteWorker()
        worker.fetchData(request: request, complete: { (response) in
            self.output.presentFetchedSuperHeros(response: response)
        }) { (error) in
           // self.output.presentFetchedSuperHeros(response: nil)

        }
       }

}

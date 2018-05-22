//
//  ComicsInteractor.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                  Interactor
   This is the “mediator” between the Worker and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the Worker. Before proceeding to the Worker, a validation is done to check if everything is sent properly. If everything is ok, the Worker returns a response and the Interactor passes that response towards the Presenter. */
protocol ComicsInteractorInput {

    func fetchComic(request:ComicsModel.Fetch.Request)
}

protocol ComicsInteractorOutput: class {
    func presentFetchedComic(response:ComicsModel.Fetch.Response)

}
class ComicsInteractor:ComicsInteractorInput {

    weak var output: ComicsInteractorOutput?
    var worker: ComicsRemoteWorker!
    
    func fetchComic(request: ComicsModel.Fetch.Request) {
        
//        if request.parameters.count  == 0  {
//           self.output.presentFetchMovies(movies: [])
//        }
        worker = ComicsRemoteWorker()
        worker.fetchMovies(request: request, complete: { (response) in
            self.output?.presentFetchedComic(response: response)
        }) { (error) in
           // self.output.presentFetchedSuperHeros(response: nil)

        }
       }

}

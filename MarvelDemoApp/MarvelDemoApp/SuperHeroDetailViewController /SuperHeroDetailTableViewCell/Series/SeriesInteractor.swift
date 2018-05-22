//
//  SeriesInteractor.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                  Interactor
   This is the “mediator” between the Worker and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the Worker. Before proceeding to the Worker, a validation is done to check if everything is sent properly. If everything is ok, the Worker returns a response and the Interactor passes that response towards the Presenter. */
protocol SeriesInteractorInput {

    func fetchSeries(request:SeriesModel.Fetch.Request)
}

protocol SeriesInteractorOutput: class {
    func presentFetchedSeries(response:SeriesModel.Fetch.Response)

}
class SeriesInteractor:SeriesInteractorInput {

    weak var output: SeriesInteractorOutput?
    var worker: SeriesRemoteWorker!
    
    func fetchSeries(request: SeriesModel.Fetch.Request) {
        
//        if request.parameters.count  == 0  {
//           self.output.presentFetchMovies(movies: [])
//        }
        worker = SeriesRemoteWorker()
        worker.fetchMovies(request: request, complete: { (response) in
            self.output?.presentFetchedSeries(response: response)
        }) { (error) in
           // self.output.presentFetchedSuperHeros(response: nil)

        }
       }

}

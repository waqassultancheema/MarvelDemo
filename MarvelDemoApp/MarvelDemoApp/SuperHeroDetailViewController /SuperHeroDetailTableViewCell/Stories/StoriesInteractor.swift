//
//  StoriesInteractor.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                  Interactor
   This is the “mediator” between the Worker and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the Worker. Before proceeding to the Worker, a validation is done to check if everything is sent properly. If everything is ok, the Worker returns a response and the Interactor passes that response towards the Presenter. */
protocol StoriesInteractorInput {

    func fetchStories(request:StoriesModel.Fetch.Request)
}

protocol StoriesInteractorOutput: class {
    func presentFetchedStories(response:StoriesModel.Fetch.Response)
    func presentError(errorString:String)

}
class StoriesInteractor:StoriesInteractorInput {

    weak var output: StoriesInteractorOutput?
    var worker: StoriesRemoteWorker!
    
    func fetchStories(request: StoriesModel.Fetch.Request) {
        
//        if request.parameters.count  == 0  {
//           self.output.presentFetchMovies(movies: [])
//        }
        worker = StoriesRemoteWorker()
        worker.fetchMovies(request: request, complete: { (response) in
            self.output?.presentFetchedStories(response: response)
        }) { (error) in
            self.output?.presentError(errorString: error?.localizedDescription ?? "")
           // self.output.presentFetchedSuperHeros(response: nil)

        }
       }

}

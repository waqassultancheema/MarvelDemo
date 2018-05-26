//
//  EventsInteractor.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                  Interactor
   This is the “mediator” between the Worker and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the Worker. Before proceeding to the Worker, a validation is done to check if everything is sent properly. If everything is ok, the Worker returns a response and the Interactor passes that response towards the Presenter. */
protocol EventsInteractorInput {

    func fetchEvent(request:EventsModel.Fetch.Request)
}

protocol EventsInteractorOutput: class {
    func presentFetchedEvent(response:EventsModel.Fetch.Response)

}
class EventsInteractor:EventsInteractorInput {

    weak var output: EventsInteractorOutput?
    var worker: EventsRemoteWorker!
    
    func fetchEvent(request: EventsModel.Fetch.Request) {
        

        worker = EventsRemoteWorker()
        worker.fetchMovies(request: request, complete: { (response) in
            self.output?.presentFetchedEvent(response: response)
        }) { (error) in
              print(error ?? "")
        }
       }

}

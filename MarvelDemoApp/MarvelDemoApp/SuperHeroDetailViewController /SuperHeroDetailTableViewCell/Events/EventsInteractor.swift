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
    var worker: EventWorker!
    
    func fetchEvent(request: EventsModel.Fetch.Request) {
        worker = EventWorker()
        worker.output  = self
        worker.fetchEvents(request: request)
    }
}

extension EventsInteractor: EventWorkerOutput {
    func presentFetchedEvent(response: EventsModel.Fetch.Response) {
        self.output?.presentFetchedEvent(response: response)
    }
    
    
}

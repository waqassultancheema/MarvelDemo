//
//  EventLocalWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

protocol EventLocalWorkerInput {
    
    func fetchEvents(request:EventsModel.Fetch.Request)
}

protocol EventLocalWorkerOutput {
    func presentFetchedEvent(response:EventsModel.Fetch.Response)
    
}
class EventLocalWorker: EventWorkerInput {
    
    var output: EventLocalWorkerOutput!

    func fetchEvents(request: EventsModel.Fetch.Request) {
        let event = Storage.retrieve(request.localSaveURL, from: .caches, as: EventsModel.Fetch.Response.self)
            self.output.presentFetchedEvent(response: event)
    }
    

    
}

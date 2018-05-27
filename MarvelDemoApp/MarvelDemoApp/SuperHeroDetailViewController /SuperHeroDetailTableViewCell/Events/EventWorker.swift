//
//  EventWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit


protocol EventWorkerInput {
    
    func fetchEvents(request:EventsModel.Fetch.Request)
}

protocol EventWorkerOutput {
    func presentFetchedEvent(response:EventsModel.Fetch.Response)
    
}
class EventWorker:EventWorkerInput {
   
    
    
    var output: EventWorkerOutput!
    var remoteWorker: EventsRemoteWorker!
    var localWorker: EventLocalWorker!
    func fetchEvents(request: EventsModel.Fetch.Request) {
        
        if Storage.fileExists(request.localSaveURL, in: .caches) {
            localWorker  = EventLocalWorker()
            localWorker.output = self
            localWorker.fetchEvents(request: request)
        } else {
            remoteWorker = EventsRemoteWorker()
            remoteWorker.fetchData(request: request, complete: { (response) in
         //       DispatchQueue.main.async() {
                    Storage.store(response, to: .caches, as: request.localSaveURL)

          //      }
                self.output?.presentFetchedEvent(response: response)
                
            }) { (error) in
                
                print(error ?? "")
                
            }

        }
    }
    
}
extension EventWorker : EventLocalWorkerOutput {
    func presentFetchedEvent(response: EventsModel.Fetch.Response) {
        self.output.presentFetchedEvent(response: response)
    }
    
    
}

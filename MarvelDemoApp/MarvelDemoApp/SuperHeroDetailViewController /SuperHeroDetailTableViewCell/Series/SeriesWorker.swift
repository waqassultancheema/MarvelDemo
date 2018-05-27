//
//  SeriesWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit


protocol SeriesWorkerInput {
    
    func fetchSeriess(request:SeriesModel.Fetch.Request)
}

protocol SeriesWorkerOutput {
    func presentFetchedSeries(response:SeriesModel.Fetch.Response)
    
}
class SeriesWorker:SeriesWorkerInput {
   
    
    
    var output: SeriesWorkerOutput!
    var remoteWorker: SeriesRemoteWorker!
    var localWorker: SeriesLocalWorker!
    func fetchSeriess(request: SeriesModel.Fetch.Request) {
        
        if Storage.fileExists(request.localSaveURL, in: .caches) {
            localWorker  = SeriesLocalWorker()
            localWorker.output = self
            localWorker.fetchSeriess(request: request)
        } else {
            remoteWorker = SeriesRemoteWorker()
            remoteWorker.fetchData(request: request, complete: { (response) in
         //       DispatchQueue.main.async() {
                    Storage.store(response, to: .caches, as: request.localSaveURL)

          //      }
                self.output?.presentFetchedSeries(response: response)
                
            }) { (error) in
                
                print(error ?? "")
                
            }

        }
    }
    
}
extension SeriesWorker : SeriesLocalWorkerOutput {
    func presentFetchedSeries(response: SeriesModel.Fetch.Response) {
        self.output.presentFetchedSeries(response: response)
    }
    
    
}

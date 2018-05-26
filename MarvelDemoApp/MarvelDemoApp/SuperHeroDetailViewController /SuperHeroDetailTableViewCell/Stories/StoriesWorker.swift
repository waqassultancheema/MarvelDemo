//
//  StoriesWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit


protocol StoriesWorkerInput {
    
    func fetchStoriess(request:StoriesModel.Fetch.Request)
}

protocol StoriesWorkerOutput {
    func presentFetchedStories(response:StoriesModel.Fetch.Response)
    func presentError(error:String)
    
}
class StoriesWorker:StoriesWorkerInput {
   
    
    
    var output: StoriesWorkerOutput!
    var remoteWorker: StoriesRemoteWorker!
    var localWorker: StoriesLocalWorker!
    func fetchStoriess(request: StoriesModel.Fetch.Request) {
        
        if Storage.fileExists(request.localSaveURL, in: .caches) {
            localWorker  = StoriesLocalWorker()
            localWorker.output = self
            localWorker.fetchStoriess(request: request)
        } else {
            remoteWorker = StoriesRemoteWorker()
            remoteWorker.fetchData(request: request, complete: { (response) in
         //       DispatchQueue.main.async() {
                    Storage.store(response, to: .caches, as: request.localSaveURL)

          //      }
                self.output?.presentFetchedStories(response: response)
                
            }) { (error) in
                self.output?.presentError(error:error?.localizedDescription ?? "")

                print(error ?? "")
                
            }

        }
    }
    
}
extension StoriesWorker : StoriesLocalWorkerOutput {
    func presentFetchedStories(response: StoriesModel.Fetch.Response) {
        self.output.presentFetchedStories(response: response)
    }
    
    
}

//
//  ComicsWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit


protocol ComicsWorkerInput {
    
    func fetchComicss(request:ComicsModel.Fetch.Request)
}

protocol ComicsWorkerOutput {
    func presentFetchedComics(response:ComicsModel.Fetch.Response)
    
}
class ComicsWorker:ComicsWorkerInput {
   
    
    
    var output: ComicsWorkerOutput!
    var remoteWorker: ComicsRemoteWorker!
    var localWorker: ComicsLocalWorker!
    func fetchComicss(request: ComicsModel.Fetch.Request) {
        
        if Storage.fileExists(request.localSaveURL, in: .caches) {
            localWorker  = ComicsLocalWorker()
            localWorker.output = self
            localWorker.fetchComicss(request: request)
        } else {
            remoteWorker = ComicsRemoteWorker()
            remoteWorker.fetchData(request: request, complete: { (response) in
         //       DispatchQueue.main.async() {
                    Storage.store(response, to: .caches, as: request.localSaveURL)

          //      }
                self.output?.presentFetchedComics(response: response)
                
            }) { (error) in
                
                print(error ?? "")
                
            }

        }
    }
    
}
extension ComicsWorker : ComicsLocalWorkerOutput {
    func presentFetchedComics(response: ComicsModel.Fetch.Response) {
        self.output.presentFetchedComics(response: response)
    }
    
    
}

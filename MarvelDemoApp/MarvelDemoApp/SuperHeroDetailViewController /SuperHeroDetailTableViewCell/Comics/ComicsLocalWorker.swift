//
//  ComicsLocalWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ComicsLocalWorkerInput {
    
    func fetchComics(request:ComicsModel.Fetch.Request)
}

protocol ComicsLocalWorkerOutput {
    func presentFetchedComics(response:ComicsModel.Fetch.Response)
    
}
class ComicsLocalWorker: ComicsWorkerInput {
    
    var output: ComicsLocalWorkerOutput!

    func fetchComicss(request: ComicsModel.Fetch.Request) {
        let Comics = Storage.retrieve(request.localSaveURL, from: .caches, as: ComicsModel.Fetch.Response.self)
            self.output.presentFetchedComics(response: Comics)
    }
    

    
}

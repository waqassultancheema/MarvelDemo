//
//  StoriesLocalWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

protocol StoriesLocalWorkerInput {
    
    func fetchStories(request:StoriesModel.Fetch.Request)
}

protocol StoriesLocalWorkerOutput {
    func presentFetchedStories(response:StoriesModel.Fetch.Response)
    
}
class StoriesLocalWorker: StoriesWorkerInput {
    
    var output: StoriesLocalWorkerOutput!

    func fetchStoriess(request: StoriesModel.Fetch.Request) {
        let Stories = Storage.retrieve(request.localSaveURL, from: .caches, as: StoriesModel.Fetch.Response.self)
            self.output.presentFetchedStories(response: Stories)
    }
    

    
}

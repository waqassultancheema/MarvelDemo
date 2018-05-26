//
//  SeriesLocalWorker.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

protocol SeriesLocalWorkerInput {
    
    func fetchSeriess(request:SeriesModel.Fetch.Request)
}

protocol SeriesLocalWorkerOutput {
    func presentFetchedSeries(response:SeriesModel.Fetch.Response)
    
}
class SeriesLocalWorker: SeriesWorkerInput {
    
    var output: SeriesLocalWorkerOutput!

    func fetchSeriess(request: SeriesModel.Fetch.Request) {
        let Series = Storage.retrieve(request.localSaveURL, from: .caches, as: SeriesModel.Fetch.Response.self)
            self.output.presentFetchedSeries(response: Series)
    }
    

    
}

//
//  StoriesInteractor.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit
/*                  Interactor
   This is the “mediator” between the Worker and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the Worker. Before proceeding to the Worker, a validation is done to check if everything is sent properly. If everything is ok, the Worker returns a response and the Interactor passes that response towards the Presenter. */
protocol StoriesInteractorInput {

    func fetchStories(request:StoriesModel.Fetch.Request)
}

protocol StoriesInteractorOutput: class {
    func presentFetchedStories(response:StoriesModel.Fetch.Response)
    func presentError(errorString:String)

}
class StoriesInteractor:StoriesInteractorInput {

    weak var output: StoriesInteractorOutput?
    var worker: StoriesWorker!
    
    func fetchStories(request: StoriesModel.Fetch.Request) {
        worker = StoriesWorker()
        worker.output = self
        worker.fetchStoriess(request: request)
    }
}

extension StoriesInteractor: StoriesWorkerOutput {
    func presentFetchedStories(response: StoriesModel.Fetch.Response) {
        self.output?.presentFetchedStories(response: response)
    }
    
    
    
}

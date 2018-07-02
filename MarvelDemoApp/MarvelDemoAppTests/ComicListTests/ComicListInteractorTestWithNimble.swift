//
//  ComicListInteractorTest.swift
//  MarvelDemoAppTests
//
//  Created by Waqas Sultan on 6/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//



//import XCTest
import UIKit
import Quick
import Nimble

@testable import MarvelDemoApp
class ComicListInteractorTestWithNimble: QuickSpec {
    var sut:SuperHeroInteractor!
    var reponse:SuperHeroList.Fetch.Response!
    override func spec() {
      
         sut = SuperHeroInteractor()
        self.sut.worker = SuperHeroRemoteWorkerDummy()
         self.sut.output = self
        describe("API Call") {
            context("Will Fetch SuperHeroFromServer", {
                it("Will should give 200 in response", closure: { [unowned self] in
                    
                    
                   
                    self.sut.fetchSuperHeros(request: SuperHeroList.Fetch.Request(isFilteredApplied: false, offset:1, limit: 10, searchQuery: ""))
                    expect( self.reponse.code).to(equal(200))
                })
            })
        }
    }
}

extension  ComicListInteractorTestWithNimble: SuperHeroInteractorOutput
{
    func presentFetchedSuperHeros(response: SuperHeroList.Fetch.Response) {
        
        reponse = response
    }
}

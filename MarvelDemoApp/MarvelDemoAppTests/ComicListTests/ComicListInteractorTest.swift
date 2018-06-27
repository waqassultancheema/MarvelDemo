//
//  ComicListInteractorTest.swift
//  MarvelDemoAppTests
//
//  Created by Waqas Sultan on 6/26/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

@testable import MarvelDemoApp

import XCTest
class SuperHeroRemoteWorkerDummy:SuperHeroRemoteWorker {
    var mockResponse:String = "{ \"code\": 200, \"status\": \"Ok\", \"copyright\": \"\", \"attributionText\": \"\", \"attributionHTML\": \"\", \"etag\": \"\", \"data\": { \"offset\": 10, \"limit\": 1, \"total\": 1491, \"count\": 1, \"results\": [ { \"id\": 1010354, \"name\": \"\", \"description\": \"\", \"modified\": \"\", \"thumbnail\": { \"path\": \"\", \"extension\": \"\" }, \"resourceURI\": \"\", \"comics\": { \"available\": 0, \"collectionURI\": \"\", \"items\": [ { \"resourceURI\": \"\", \"name\": \"\" } ], \"returned\": 0 }, \"series\": { \"available\": 0, \"collectionURI\": \"\", \"items\": [ { \"resourceURI\": \"\", \"name\": \"\" } ], \"returned\": 0 }, \"stories\": { \"available\": 0, \"collectionURI\": \"\", \"items\": [ { \"resourceURI\": \"\", \"name\": \"\", \"type\": \"\" } ], \"returned\": 0 }, \"events\": { \"available\": 0, \"collectionURI\": \"\", \"items\": [ { \"resourceURI\": \"\", \"name\": \"\" } ], \"returned\": 0 }, \"urls\": [ { \"type\": \"\", \"url\": \"\" } ] } ] } }"
    override func fetchData(request: SuperHeroList.Fetch.Request, complete: @escaping (SuperHeroList.Fetch.Response) -> Void, failure: @escaping (Error?) -> Void) {
        
       
        do {
            let response = try SuperHeroList.Fetch.Response(mockResponse)
            complete(response)
        } catch {
             failure(nil)
        }
        
    }
}



class ComicListInteractorTest: XCTestCase {
    
    var sut:SuperHeroInteractor!
    var reponse:SuperHeroList.Fetch.Response!
    override func setUp() {
        super.setUp()
        sut = SuperHeroInteractor()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchSuperHeroList() {
        sut.worker = SuperHeroRemoteWorkerDummy()
        sut.output = self
        sut.fetchSuperHeros(request: SuperHeroList.Fetch.Request(isFilteredApplied: false, offset:1, limit: 10, searchQuery: ""))
        
        XCTAssert(reponse.code == 200, "Response Came Good")
       
    
        
    }
    
    
}

extension  ComicListInteractorTest: SuperHeroInteractorOutput
{
    func presentFetchedSuperHeros(response: SuperHeroList.Fetch.Response) {
        reponse = response
    }
}

//
//  MovieRemoteApi.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/9/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//



import UIKit

/*          Worker
    The Worker component will handle all the API/CoreData requests and responses. The Response struct (from Models) will get the data ready for the Interactor. It will handle the success/error response, so the Interactor would know how to proceed.
 */

//https://gateway.marvel.com/v1/public/characters?ts=1&limit=1&offset=10&apikey=4e58a69173498255e53a2f700a2ae54a&hash=e4862dd7fb9ed77558b02711ee240469
class SeriesRemoteWorker: WebAPIHandler {
   
    
    func fetchData(request: SeriesModel.Fetch.Request, complete :@escaping (SeriesModel.Fetch.Response) -> Void, failure:@escaping (Error?) -> Void) {
        
        getDataFromServer(url: request.mURL) { (response, error) in
            
            guard error == nil else {
                failure(error)
                return
            }
            
            if let mData = response as? Data {
                
                do {
                    let response = try SeriesModel.Fetch.Response(data: mData)
                    complete(response)
                } catch  {
                    failure(nil)
                }
            }
        }

    }
    
    
    
}

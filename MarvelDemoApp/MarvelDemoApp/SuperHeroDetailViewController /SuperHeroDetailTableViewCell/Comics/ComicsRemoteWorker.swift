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
class ComicsRemoteWorker: WebAPIHandler {
   
    
    func fetchMovies(request: ComicsModel.Fetch.Request, complete :@escaping (ComicsModel.Fetch.Response) -> Void, failure:@escaping (Error?) -> Void) {
        
        getDataFromServer(url: request.mURL) { (response, error) in
            
            guard error == nil else {
                failure(error)
                return
            }
            
            if let mData = response as? Data {
                
                do {
                    let response = try ComicsModel.Fetch.Response(data: mData)
                    complete(response)
                } catch  {
                    failure(nil)
                }
            }
        }

        failure(nil)
    }
    
    
    
}


// MARK: - Movie API

//struct MovieAPI: WebAPIHandler {
//    func getMoviesList(url: String, completion: @escaping onCompletion) {
//        getDataFromServer(url: url, type: .SuperHeroList) { (response, error) in
//            guard error == nil else {
//                completion(nil, error)
//                return
//            }
//            if let mData = response as? Data {
//                let decoder = JSONDecoder()
//                let mData = try! decoder.decode(SuperHeroList.Fetch.Response.self, from: mData)
//                completion(mData, nil)
//            }
//        }
//    }
//}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func parentBoTask(with url: URL, completionHandler: @escaping (SuperHeroList.Fetch.Response?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

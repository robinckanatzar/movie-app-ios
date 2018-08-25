//
//  SearchMoviesService.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class SearchMoviesService: Service {
    override var path: String {
        get {
            return "search/movie"
        }
    }
}

extension SearchMoviesService: SearchMoviesServiceProtocol {
    
    func fetchResults(with query: String, completion: @escaping ServiceResultCompletion<[Movie]>) {
        
        if let path = Bundle.main.path(forResource: "PrivateKeys", ofType: "plist") {
            let dictRoot = NSDictionary(contentsOfFile: path)
            if let dict = dictRoot {
                let apiKey = dict["TheMovieDatabaseAPIKey"] as! String
                // TODO replace spaces with "+" in query
                let fullPath = "\(path)?api_key=\(apiKey)&query=\(query)"
                clientHTTP.makeRequest(on: fullPath) { (result) in
                    completion(result)
                }
            }
        }
    }
    
    // example call:
    // https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
}

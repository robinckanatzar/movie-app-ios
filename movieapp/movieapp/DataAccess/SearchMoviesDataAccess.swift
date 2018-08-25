//
//  SearchMoviesDataAccess.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class SearchMoviesDataAccess {
    
    let movieList = Observable<[Movie]>()
    
    var service: SearchMoviesServiceProtocol
    
    init(service: SearchMoviesServiceProtocol) {
        self.service = service
    }
}

extension SearchMoviesDataAccess {
    func clearData() {
        movieList.value = nil
    }
}

extension SearchMoviesDataAccess: SearchMoviesDataAccessProtocol {
    
    func fetchResults(with query: String, completion: @escaping (ServiceError?) -> Void) {
        service.fetchResults(with: query, completion: { (result) in
            switch result {
            case .success(let items):
                self.movieList.value = items
                completion(nil)
            case .failure(let error):
                print("\(error)")
                completion(error)
            }
        })
    }
}

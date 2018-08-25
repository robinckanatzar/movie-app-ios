//
//  SearchMoviesDataAccess.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class SearchMoviesDataAccess {
    var service: SearchMoviesServiceProtocol
    
    init(service: SearchMoviesServiceProtocol) {
        self.service = service
    }
}

extension SearchMoviesDataAccess {
    func clearData() {
        
    }
}

extension SearchMoviesDataAccess: SearchMoviesDataAccessProtocol {
    
}

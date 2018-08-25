//
//  SearchMoviesDataAccessProtocol.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

protocol SearchMoviesDataAccessProtocol: DataAccessProtocol {
    var movieList: Observable<[Movie]> { get }
    func fetchResults(with query: String, completion: @escaping (ServiceError?) -> Void)
}

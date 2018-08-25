//
//  Movie.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import UIKit
import Marshal

struct Movie {
    let id: Int
    let title: String
    let overview: String
    let posterPath: URL?
}

extension Movie: Unmarshaling {
    
    init(object: MarshaledObject) throws {
        id = try object.value(for: "id")
        title = try object.value(for: "title")
        overview = try object.value(for: "overview")
        if let urlString: String = try object.value(for: "poster_path") {
            posterPath = URL(string: urlString)
        } else {
            posterPath = nil
        }
    }
}

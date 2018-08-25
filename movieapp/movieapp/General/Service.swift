//
//  Service.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class Service {
    
    // MARK: - Dependencies
    let clientHTTP: ClientHTTPProtocol
    
    // MARK: - Var
    var path: String {
        get {
            return ""
        }
    }
    
    // MARK: - Lifecycle
    init(clientHTTP: ClientHTTPProtocol) {
        self.clientHTTP = clientHTTP
    }
}

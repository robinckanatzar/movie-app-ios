//
//  AuthenticationDataAccess.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class AuthenticationDataAccess {
    var service: AuthenticationServiceProtocol
    
    init(service: AuthenticationServiceProtocol) {
        self.service = service
    }
}

extension AuthenticationDataAccess {
    func clearData() {
        
    }
}

extension AuthenticationDataAccess: AuthenticationDataAccessProtocol {
    
}

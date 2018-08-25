//
//  MyListsDataAccess.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class MyListsDataAccess {
    var service: MyListsServiceProtocol
    
    init(service: MyListsServiceProtocol) {
        self.service = service
    }
}

extension MyListsDataAccess {
    func clearData() {
        
    }
}

extension MyListsDataAccess: MyListsDataAccessProtocol {
    
}

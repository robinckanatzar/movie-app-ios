//
//  MyFriendsDataAccess.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class MyFriendsDataAccess {
    var service: MyFriendsServiceProtocol
    
    init(service: MyFriendsServiceProtocol) {
        self.service = service
    }
}

extension MyFriendsDataAccess {
    func clearData() {
        
    }
}

extension MyFriendsDataAccess: MyFriendsDataAccessProtocol {
    
}

//
//  SplashViewModel.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

class SplashViewModel: ViewModel {
    
    override init(router: RouterProtocol, authenticationDataAccess: AuthenticationDataAccessProtocol, searchMoviesDataAccess: SearchMoviesDataAccessProtocol, myListsDataAccess: MyListsDataAccessProtocol, myFriendsDataAccess: MyFriendsDataAccessProtocol) {
        
        super.init(router: router, authenticationDataAccess: authenticationDataAccess, searchMoviesDataAccess: searchMoviesDataAccess, myListsDataAccess: myListsDataAccess, myFriendsDataAccess: myFriendsDataAccess)
        
    }
}

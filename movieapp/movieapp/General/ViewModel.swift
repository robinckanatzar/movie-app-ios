//
//  ViewModel.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import UIKit
import CoreMotion

class ViewModel {
    internal let router: RouterProtocol
    internal let authenticationDataAccess: AuthenticationDataAccessProtocol
    internal let searchMoviesDataAccess: SearchMoviesDataAccessProtocol
    internal let myListsDataAccess: MyListsDataAccessProtocol
    internal let myFriendsDataAccess: MyFriendsDataAccessProtocol
    
    init(router: RouterProtocol, authenticationDataAccess: AuthenticationDataAccessProtocol, searchMoviesDataAccess: SearchMoviesDataAccessProtocol, myListsDataAccess: MyListsDataAccessProtocol, myFriendsDataAccess: MyFriendsDataAccessProtocol) {
        self.router = router
        self.authenticationDataAccess = authenticationDataAccess
        self.searchMoviesDataAccess = searchMoviesDataAccess
        self.myListsDataAccess = myListsDataAccess
        self.myFriendsDataAccess = myFriendsDataAccess
    }
    
    func present<Screen: UIViewController>(_ screenType: Screen.Type) {
        router.present(screenType, animated: true)
    }
    
    func goToMainScreen() {
        router.replaceLast(with: SearchMoviesViewController.self, animated: true)
    }
}

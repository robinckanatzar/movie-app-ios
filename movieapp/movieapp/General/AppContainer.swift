//
//  AppContainer.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation
import Swinject

class AppContainer: DependencyContainer {

    private unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    override func registerDependencies(in container: Container) {
        registerCommon(in: container)
        registerService(in: container)
        registerDataAccess(in: container)
        registerScreens(in: container)
    }
    
    private func registerCommon(in container: Container) {
        // Screen Resolver
        container.register(ScreenResolverProtocol.self) { r in
            return ScreenResolver(container: self)
            }.inObjectScope(.container)
        
        // Router
        container.register(RouterProtocol.self) { r in
            let screenResolver = r.resolve(ScreenResolverProtocol.self)!
            return Router(navigationController: self.navigationController, screenResolver: screenResolver)
            }.inObjectScope(.container)
    }
    
    private func registerService(in container: Container) {
    
        container.register(ClientHTTPProtocol.self) { r in
            return ClientHTTP()
            }.inObjectScope(.weak)
        
        // Authentication Service
        container.register(AuthenticationServiceProtocol.self) { r in
            let clientHTTP = r.resolve(ClientHTTPProtocol.self)!
            return AuthenticationService(clientHTTP: clientHTTP)
            }.inObjectScope(.weak)
        
        // Search Movies Service
        container.register(SearchMoviesServiceProtocol.self) { r in
            let clientHTTP = r.resolve(ClientHTTPProtocol.self)!
            return SearchMoviesService(clientHTTP: clientHTTP)
            }.inObjectScope(.weak)
        
        // My Friends Service
        container.register(MyFriendsServiceProtocol.self) { r in
            let clientHTTP = r.resolve(ClientHTTPProtocol.self)!
            return MyFriendsService(clientHTTP: clientHTTP)
            }.inObjectScope(.weak)
        
        // My Lists Service
        container.register(MyListsServiceProtocol.self) { r in
            let clientHTTP = r.resolve(ClientHTTPProtocol.self)!
            return MyListsService(clientHTTP: clientHTTP)
            }.inObjectScope(.weak)
    }
    
    private func registerDataAccess(in container: Container) {
    
        // Search Movies Data Access
        container.register(SearchMoviesDataAccessProtocol.self) { r in
            let service = r.resolve(SearchMoviesServiceProtocol.self)!
            let dataAccess = SearchMoviesDataAccess(service: service)
            return dataAccess
            }.inObjectScope(.container)
        
        // Authentication Data Access
        container.register(AuthenticationDataAccessProtocol.self) { r in
            let service = r.resolve(AuthenticationServiceProtocol.self)!
            let dataAccess = AuthenticationDataAccess(service: service)
            return dataAccess
            }.inObjectScope(.container)
        
        // My Friends Data Access
        container.register(MyFriendsDataAccessProtocol.self) { r in
            let service = r.resolve(MyFriendsServiceProtocol.self)!
            let dataAccess = MyFriendsDataAccess(service: service)
            return dataAccess
            }.inObjectScope(.container)
        
        // My Lists Data Access
        container.register(MyListsDataAccessProtocol.self) { r in
            let service = r.resolve(MyListsServiceProtocol.self)!
            let dataAccess = MyListsDataAccess(service: service)
            return dataAccess
            }.inObjectScope(.container)
    }
    
    private func registerScreens(in container: Container) {
    
        // Splash
        container.register(SplashViewModel.self) { r in
            return SplashViewModel(router: self.router,
                                   authenticationDataAccess: self.authenticationDataAccess,
                                   searchMoviesDataAccess: self.searchMoviesDataAccess,
                                   myListsDataAccess: self.myListsDataAccess,
                                   myFriendsDataAccess: self.myFriendsDataAccess)
            }.inObjectScope(.weak)
        
        container.register(SplashViewController.self) { r in
            let vc = StoryboardScene.Main.splashViewController.instantiate()
            let vm = r.resolve(SplashViewModel.self)!
            vc.viewModel = vm
            return vc
            }.inObjectScope(.weak)
        
        // Search Movies
        container.register(SearchMoviesViewModel.self) { r in
            return SearchMoviesViewModel(router: self.router,
                                         authenticationDataAccess: self.authenticationDataAccess,
                                         searchMoviesDataAccess: self.searchMoviesDataAccess,
                                         myListsDataAccess: self.myListsDataAccess,
                                         myFriendsDataAccess: self.myFriendsDataAccess)
            }.inObjectScope(.weak)
        
        container.register(SearchMoviesViewController.self) { r in
            let vc = StoryboardScene.Main.searchMoviesViewController.instantiate()
            let vm = r.resolve(SearchMoviesViewModel.self)!
            vc.viewModel = vm
            return vc
            }.inObjectScope(.weak)
        
        // My Lists
        container.register(MyListsViewModel.self) { r in
            return MyListsViewModel(router: self.router,
                                    authenticationDataAccess: self.authenticationDataAccess,
                                    searchMoviesDataAccess: self.searchMoviesDataAccess,
                                    myListsDataAccess: self.myListsDataAccess,
                                    myFriendsDataAccess: self.myFriendsDataAccess)
            }.inObjectScope(.weak)
        
        container.register(MyListsViewController.self) { r in
            let vc = StoryboardScene.Main.myListsViewController.instantiate()
            let vm = r.resolve(MyListsViewModel.self)!
            vc.viewModel = vm
            return vc
            }.inObjectScope(.weak)
        
        // My Friends
        container.register(MyFriendsViewModel.self) { r in
            return MyFriendsViewModel(router: self.router,
                                      authenticationDataAccess: self.authenticationDataAccess,
                                      searchMoviesDataAccess: self.searchMoviesDataAccess,
                                      myListsDataAccess: self.myListsDataAccess,
                                      myFriendsDataAccess: self.myFriendsDataAccess)
            }.inObjectScope(.weak)
        
        container.register(MyFriendsViewController.self) { r in
            let vc = StoryboardScene.Main.myFriendsViewController.instantiate()
            let vm = r.resolve(MyFriendsViewModel.self)!
            vc.viewModel = vm
            return vc
            }.inObjectScope(.weak)
        
        // Login
        container.register(LoginViewModel.self) { r in
            return LoginViewModel(router: self.router,
                                  authenticationDataAccess: self.authenticationDataAccess,
                                  searchMoviesDataAccess: self.searchMoviesDataAccess,
                                  myListsDataAccess: self.myListsDataAccess,
                                  myFriendsDataAccess: self.myFriendsDataAccess)
            }.inObjectScope(.weak)
        
        container.register(LoginViewController.self) { r in
            let vc = StoryboardScene.Main.loginViewController.instantiate()
            let vm = r.resolve(LoginViewModel.self)!
            vc.viewModel = vm
            return vc
            }.inObjectScope(.weak)
        
        // ForgotPassword
        container.register(ForgotPasswordViewModel.self) { r in
            return ForgotPasswordViewModel(router: self.router,
                                           authenticationDataAccess: self.authenticationDataAccess,
                                           searchMoviesDataAccess: self.searchMoviesDataAccess,
                                           myListsDataAccess: self.myListsDataAccess,
                                           myFriendsDataAccess: self.myFriendsDataAccess)
            }.inObjectScope(.weak)
        
        container.register(ForgotPasswordViewController.self) { r in
            let vc = StoryboardScene.Main.forgotPasswordViewController.instantiate()
            let vm = r.resolve(ForgotPasswordViewModel.self)!
            vc.viewModel = vm
            return vc
            }.inObjectScope(.weak)
        
        // Tab Bar
        container.register(TabBarViewController.self) { r in
            let vc = StoryboardScene.Main.tabBarViewController.instantiate()
            return vc as! TabBarViewController
            }.inObjectScope(.weak)
    }
}

extension AppContainer {
    var router: RouterProtocol {
        return resolve(RouterProtocol.self)!
    }
    
    var searchMoviesDataAccess: SearchMoviesDataAccessProtocol {
        return resolve(SearchMoviesDataAccessProtocol.self)!
    }
    
    var authenticationDataAccess: AuthenticationDataAccessProtocol {
        return resolve(AuthenticationDataAccessProtocol.self)!
    }
    
    var myFriendsDataAccess: MyFriendsDataAccessProtocol {
        return resolve(MyFriendsDataAccessProtocol.self)!
    }
    
    var myListsDataAccess: MyListsDataAccessProtocol {
        return resolve(MyListsDataAccessProtocol.self)!
    }
}

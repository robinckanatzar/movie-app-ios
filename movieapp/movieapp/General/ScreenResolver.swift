//
//  ScreenResolver.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

struct ScreenResolver: ScreenResolverProtocol {
    
    unowned var container: AppContainer
    
    func resolve<Screen>(screenType: Screen.Type) -> Screen {
        guard let vc = container.resolve(screenType) else {
            fatalError("\(screenType) not found into app container")
        }
        return vc
    }
    
    func resolve<Screen, Arg1>(screenType: Screen.Type, argument: Arg1) -> Screen {
        guard let vc = container.resolve(screenType, argument: argument) else {
            fatalError("\(screenType) not found into app container")
        }
        return vc
    }
}

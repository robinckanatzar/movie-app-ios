//
//  ScreenResolverProtocol.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import Foundation

protocol ScreenResolverProtocol {
    func resolve<Screen>(screenType: Screen.Type) -> Screen
    func resolve<Screen, Arg1>(screenType: Screen.Type, argument: Arg1) -> Screen
}

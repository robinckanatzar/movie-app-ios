//
//  SplashViewController.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import UIKit

class SplashViewController: ViewController<SplashViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // change 2 to desired number of seconds
            self.viewModel.displayNextScreen()
        }
    }
}


//
//  ViewController.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import UIKit

class ViewController<T: ViewModel>: UIViewController {

    var viewModel: T!
    
    private let loader = Loader()
    internal var isLoading: Bool = false {
        didSet {
            updateLoading()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        addDismissKeyboardGestureIfNeeded()
        setupLoading()
    }
    
    private func addDismissKeyboardGestureIfNeeded() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    private func setupLoading() {
        view.addSubview(loader)
        loader.frame = view.bounds
        view.bringSubview(toFront: loader)
        updateLoading()
    }
    private func updateLoading() {
        if isLoading {
            loader.start()
        } else {
            loader.stop()
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// TODO replace "OK" with L10.ok
extension ViewController {
    func displayAlert(title: String?, message: String?, completion: (() -> Void)? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(alertController, animated: true, completion: completion)
    }
}

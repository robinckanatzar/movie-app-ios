//
//  Loader.swift
//  movieapp
//
//  Created by Robin Kanatzar on 8/25/18.
//  Copyright © 2018 robinkanatzar. All rights reserved.
//

import UIKit
import Lottie

class Loader: UIView {

    private enum Constant {
        static let loaderHeight = CGFloat(130)
        static let loaderWidth = CGFloat(150)
        static let backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    var animationView: LOTAnimationView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = Constant.backgroundColor
        animationView = LOTAnimationView(name: "loader")
        animationView?.loopAnimation = true
        guard let animationView = animationView else {
            return
        }
        
        addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: Constant.loaderHeight).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: Constant.loaderWidth).isActive = true
    }
    
    func start() {
        isHidden = false
        animationView?.play()
    }
    
    func stop() {
        animationView?.stop()
        isHidden = true
    }
}

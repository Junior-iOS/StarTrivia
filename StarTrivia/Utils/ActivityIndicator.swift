//
//  ActivityIndicator.swift
//  StarTrivia
//
//  Created by Junior Silva on 06/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class ActivityIndicator {
    
    class func start() {
        
        let activityData: ActivityData!
        let size = CGSize(width: 40, height: 40)
        let font = UIFont(name: "Avenir Next", size: 17)
        
        activityData = ActivityData(size: size, message: "Carregando...", messageFont: font, type: .ballTrianglePath, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        
    }
    
    class func stop() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
}

//
//  BlackBackgroundView.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation
import UIKit

class BlackBackgroundView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BACKGROUND
        layer.cornerRadius = 10
    }
}

class BlackBackgroundButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BACKGROUND
        layer.cornerRadius = 10
    }
}

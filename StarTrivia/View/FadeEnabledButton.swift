//
//  FadeEnableButton.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import UIKit

class FadeEnabledButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}

//
//  StarshipsViewController.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import UIKit

class StarshipsViewController: UIViewController, PersonProtocol{
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(person.name)
    }

}

//
//  HomeworldViewController.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import UIKit

class HomeworldViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblClimate: UILabel!
    @IBOutlet weak var lblTerrain: UILabel!
    @IBOutlet weak var lblPopulation: UILabel!
    
    var person: Person!
    var api = Interactor<Homeworld>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        guard let url = URL(string: person.homeWorldUrl) else { return }
        api.fetchModel(url: url) { (homeworld) in
            if let homeworld = homeworld {
                self.setupHomeworld(with: homeworld)
            }
        }
    }
    
    func setupHomeworld(with homeworld: Homeworld) {
        lblName.text = homeworld.name
        lblClimate.text = homeworld.climate
        lblTerrain.text = homeworld.terrain
        lblPopulation.text = homeworld.population
    }
}

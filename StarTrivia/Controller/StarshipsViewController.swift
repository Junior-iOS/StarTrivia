//
//  StarshipsViewController.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import UIKit

class StarshipsViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblModel: UILabel!
    @IBOutlet weak var lblManufacturer: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblMaxSpeed: UILabel!
    @IBOutlet weak var lblCrew: UILabel!
    @IBOutlet weak var lblPassengers: UILabel!
    @IBOutlet weak var lblCargo: UILabel!
    
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var person: Person!
    var api = Interactor<Starship>()
    var starships = [String]()
    var currentStarship = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStarships()
    }
    
    fileprivate func setupStarships() {
        starships = person.starshipUlrs
        btnNext.isEnabled = starships.count > 1
        btnPrevious.isEnabled = false
        
        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
    }
    
    func getStarship(url: String) {
        guard let url = URL(string: url) else { return }
        api.fetchModel(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    fileprivate func setupView(starship: Starship) {
        lblname.text = starship.name
        lblModel.text = starship.model
        lblManufacturer.text = starship.manufacturer
        lblCost.text = starship.cost
        lblLength.text = starship.length
        lblMaxSpeed.text = starship.maxSpeed
        lblCrew.text = starship.crew
        lblPassengers.text = starship.passengers
        lblCargo.text = starship.cargo
    }
    
    @IBAction func previousClicked(_ sender: FadeEnabledButton) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: FadeEnabledButton) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        btnPrevious.isEnabled = currentStarship == 0 ? false : true
        btnNext.isEnabled = currentStarship == starships.count - 1 ? false : true
        getStarship(url: starships[currentStarship])
    }
    
}

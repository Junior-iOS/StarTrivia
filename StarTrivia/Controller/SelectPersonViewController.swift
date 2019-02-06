//
//  ViewController.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import UIKit

protocol PersonProtocol {
    var person: Person! { get set }
}

class SelectPersonViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblMass: UILabel!
    @IBOutlet weak var lblHair: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var btnHomeworld: UIButton!
    @IBOutlet weak var btnVehicle: UIButton!
    @IBOutlet weak var btnSpaceship: UIButton!
    @IBOutlet weak var btnFilm: UIButton!
    
    var api = Interactor<Person>()
    var person: Person!

    @IBAction func randomPressed(_ sender: BlackBackgroundButton) {
        let random = Int.random(in: 1 ... 87)
        guard let url = URL(string: PERSON_URL) else { return }
        
        api.fetchModel(url: url, id: random) { (person) in
            if let person = person {
                self.setupView(with: person)
                self.person = person
            }
        }
    }
    
    func setupView(with person: Person) {
        lblName.text = person.name
        lblHeight.text = person.height
        lblMass.text = person.mass
        lblHair.text = person.hair
        lblDateOfBirth.text = person.birthYear
        lblGender.text = person.gender
        
        btnHomeworld.isEnabled = !person.homeWorldUrl.isEmpty
        btnVehicle.isEnabled = !person.vehicleUlrs.isEmpty
        btnSpaceship.isEnabled = !person.starshipUlrs.isEmpty
        btnFilm.isEnabled = !person.filmUlrs.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
}


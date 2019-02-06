//
//  VehiclesViewController.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import UIKit

class VehiclesViewController: UIViewController, PersonProtocol {
    
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
    var api = Interactor<Vehicle>()
    var vehicles = [String]()
    var currentVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupVehicles()
    }
    
    fileprivate func setupVehicles() {
        vehicles = person.vehicleUlrs
        btnNext.isEnabled = vehicles.count > 1
        btnPrevious.isEnabled = false
        
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        guard let url = URL(string: url) else { return }
        api.fetchModel(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    fileprivate func setupView(vehicle: Vehicle) {
        lblname.text = vehicle.name
        lblModel.text = vehicle.model
        lblManufacturer.text = vehicle.manufacturer
        lblCost.text = vehicle.cost
        lblLength.text = vehicle.length
        lblMaxSpeed.text = vehicle.maxSpeed
        lblCrew.text = vehicle.crew
        lblPassengers.text = vehicle.passengers
        lblCargo.text = vehicle.cargo
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        btnPrevious.isEnabled = currentVehicle == 0 ? false : true
        btnNext.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        getVehicle(url: vehicles[currentVehicle])
    }
    
}

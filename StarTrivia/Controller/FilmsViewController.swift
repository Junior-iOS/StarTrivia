//
//  FilmsViewController.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblEpisode: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblProducer: UILabel!
    @IBOutlet weak var lblReleased: UILabel!
    @IBOutlet weak var txtOpening: UITextView!
    
    @IBOutlet weak var btnPrevious: FadeEnabledButton!
    @IBOutlet weak var btnNext: FadeEnabledButton!
    
    var person: Person!
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    fileprivate func getFilm(url: String) {
        
    }
    
    @IBAction func previousClicked(_ sender: FadeEnabledButton) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: FadeEnabledButton) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        btnPrevious.isEnabled = currentFilm == 0 ? false : true
        btnNext.isEnabled = currentFilm == films.count - 1 ? false : true
        getFilm(url: films[currentFilm])
    }

}

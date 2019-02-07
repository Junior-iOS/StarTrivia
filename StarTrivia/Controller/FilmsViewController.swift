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
    var api = Interactor<Film>()
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupFilms()
        setButtonState()
    }
    
    func setupFilms() {
        films = person.filmUlrs
        btnPrevious.isEnabled = false
        btnNext.isEnabled = films.count > 0
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
    }
    
    fileprivate func getFilm(url: String) {
        guard let url = URL(string: url) else { return }
        api.fetchModel(url: url) { (film) in
            if let film = film {
                self.setupView(with: film)
                ActivityIndicator.stop()
            }
        }
    }
    
    func setupView(with film: Film) {
        lblTitle.text = film.title
        lblEpisode.text = "\(film.episode)"
        lblDirector.text = film.director
        lblProducer.text = film.producer
        lblReleased.text = film.release
        txtOpening.text = film.opening
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

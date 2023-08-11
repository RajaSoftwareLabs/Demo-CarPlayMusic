//
//  ViewController.swift
//  Demo-CarPlayMusic
//
//  Created by Kumar Saurav on 11/08/23.
//

import Foundation
import UIKit

class MusicRootViewController: UIViewController, UITableViewDelegate {

    var songsTableView: SongsTableView?
    var spinner: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainStackView)
        
        let artistsStackView = UIStackView()
        artistsStackView.axis = .vertical
        artistsStackView.distribution = .fillProportionally
        artistsStackView.layer.borderWidth = 1
        artistsStackView.layer.borderColor = UIColor.black.cgColor
        artistsStackView.layer.cornerRadius = 10
        mainStackView.addArrangedSubview(artistsStackView)
        
        artistsStackView.addArrangedSubview(artistButton(title: "Bruno Mars"))
        artistsStackView.addArrangedSubview(artistButton(title: "Calvin Harris"))
        artistsStackView.addArrangedSubview(artistButton(title: "Coldplay"))
        artistsStackView.addArrangedSubview(artistButton(title: "Eminem"))
        
        mainStackView.setCustomSpacing(5, after: artistsStackView)
        
        let songsTableView = SongsTableView()
        songsTableView.layer.borderWidth = 1
        songsTableView.layer.borderColor = UIColor.black.cgColor
        songsTableView.layer.cornerRadius = 10
        songsTableView.updateTableView(songsList: MusicStructureHelpers.defaultSongs())
        mainStackView.addArrangedSubview(songsTableView)
        songsTableView.delegate = self
        self.songsTableView = songsTableView
        
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(spinner)
        self.spinner = spinner
        
        NSLayoutConstraint.activate(
            [
                artistsStackView.heightAnchor.constraint(equalToConstant: 200),
                
                mainStackView.leadingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
                    constant: 20
                ),
                mainStackView.trailingAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
                    constant: -20
                ),
                mainStackView.topAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                mainStackView.bottomAnchor.constraint(
                    equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -20
                ),
                
                spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ]
        )
    }

    @objc func didTapArtistButton(button: UIButton) {
        print(" Phone: Button with title tapped - \(String(describing: button.currentTitle))")
    }
    
    
    // MARK: - Private helpers
    
    private func artistButton(title: String) -> UIButton {
        let artistButton = UIButton()
        artistButton.setTitle(title, for: .normal)
        artistButton.setTitleColor(.black, for: .normal)
        artistButton.addTarget(
            self,
            action: #selector(didTapArtistButton(button:)),
            for: .touchUpInside
        )
        
        return artistButton
    }
}


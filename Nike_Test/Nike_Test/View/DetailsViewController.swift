//
//  DetailsViewController.swift
//  Nike_Test
//
//  Created by Robin G on 5/24/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {

    let albumView = UIView()
    let albumArt = UIImageView()
    let albumName = AlbumListLabel(fontSize: 20.0)
    let artistName = AlbumListLabel(fontSize: 16.0)
    let genre = AlbumListLabel()
    let releaseDate = AlbumListLabel()
    let copyright = AlbumListLabel(fontSize: 10.0)
    let iTunesButton = UIButton()
    
    let viewModel: AlbumDetailsViewModel
    
    init(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(albumView)
        albumView.addSubview(albumArt)
        view.addSubview(albumName)
        view.addSubview(artistName)
        view.addSubview(genre)
        view.addSubview(releaseDate)
        view.addSubview(copyright)
        view.addSubview(iTunesButton)
        
        albumName.lineBreakMode = .byWordWrapping
        albumName.numberOfLines = 0
        iTunesButton.setTitleColor(.systemBlue, for: .normal)
        iTunesButton.addTarget(self, action:#selector(self.iTunesPressed), for: .touchUpInside)
        
        let layoutMargins = view.layoutMarginsGuide
        //albumView constraints
        albumView.translatesAutoresizingMaskIntoConstraints = false
        albumView.topAnchor.constraint(equalTo: layoutMargins.topAnchor).isActive = true
        albumView.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
        albumView.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
        albumView.heightAnchor.constraint(equalTo: albumView.widthAnchor).isActive = true
        //albumArt constraints
        albumArt.translatesAutoresizingMaskIntoConstraints = false
        albumArt.topAnchor.constraint(equalTo: albumView.topAnchor, constant: 40.0).isActive = true
        albumArt.leadingAnchor.constraint(equalTo: albumView.leadingAnchor, constant: 40.0).isActive = true
        albumArt.trailingAnchor.constraint(equalTo: albumView.trailingAnchor, constant: -40.0).isActive = true
        albumArt.heightAnchor.constraint(equalTo: albumArt.widthAnchor).isActive = true
        //albumName constraints
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.topAnchor.constraint(equalTo: albumView.bottomAnchor).isActive = true
        albumName.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
        albumName.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
        //artistName constraints
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.topAnchor.constraint(equalTo: albumName.bottomAnchor).isActive = true
        artistName.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
        artistName.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
        //genre constraints
        genre.translatesAutoresizingMaskIntoConstraints = false
        genre.topAnchor.constraint(equalTo: artistName.bottomAnchor).isActive = true
        genre.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
        genre.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
        //releaseDate constraints
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.topAnchor.constraint(equalTo: genre.bottomAnchor).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
        releaseDate.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
        //copyright constraints
        copyright.translatesAutoresizingMaskIntoConstraints = false
        copyright.topAnchor.constraint(equalTo: releaseDate.bottomAnchor).isActive = true
        copyright.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
        copyright.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
        copyright.bottomAnchor.constraint(lessThanOrEqualTo: iTunesButton.topAnchor, constant: 100.0).isActive = true
        //iTunesButton
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false
        iTunesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
        iTunesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        iTunesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        iTunesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iTunesButton.setTitle("View on iTunes", for: .normal)
        
        viewModel.albumImage { [weak self] (data) in
            guard let self = self else { return }
            self.albumArt.set(data: data)
        }
        albumName.text = viewModel.name
        artistName.text = viewModel.artistName
        genre.text = viewModel.genres
        releaseDate.text = viewModel.releaseDate
        copyright.text = viewModel.copyright
    }

}

// MARK: - iTunes Button Action
extension DetailsViewController {
    @objc func iTunesPressed(sender: UIButton!) {
        guard let url = viewModel.iTunesURL else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}

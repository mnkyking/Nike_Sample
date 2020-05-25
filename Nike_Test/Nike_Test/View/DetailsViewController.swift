//
//  DetailsViewController.swift
//  Nike_Test
//
//  Created by Robin G on 5/24/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var album: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        let albumView = UIView()
        let albumArt = UIImageView()
        let albumName = AlbumListLabel(fontSize: 20.0)
        let artistName = AlbumListLabel(fontSize: 16.0)
        let genre = AlbumListLabel()
        let releaseDate = AlbumListLabel()
        let copyright = AlbumListLabel(fontSize: 10.0)
        let iTunesButton = UIButton()
        
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
        releaseDate.text = "Released"
        
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
        
        //
        guard let album = album else { return }
        if let url = URL(string: album.albumArt ?? "") {
            do {
                let data = try Data(contentsOf: url)
                albumArt.image = UIImage(data: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        albumName.text = album.name
        artistName.text = album.artistName
        if let genres = album.genres {
            for i in 0..<genres.count {
                guard let name = genres[i].name else { continue }
                guard let text = genre.text else { genre.text = name; continue}
                genre.text = text.addSuffix(name, separator: ", ")
            }
        }
        releaseDate.text = releaseDate.text?.addSuffix(album.releaseDate ?? "")
        copyright.text = album.copyright
    }

}

// MARK: - iTunes Button Action
extension DetailsViewController {
    @objc func iTunesPressed(sender: UIButton!) {
        guard let urlString = album?.iTunesURL, let url = URL(string:urlString)  else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

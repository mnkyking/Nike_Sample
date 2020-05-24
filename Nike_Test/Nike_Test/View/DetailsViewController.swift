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
    
    /*
    `Details View`
    where we see a larger image at the top of the screen and the same information that was shown on the `cell`, plus `genre`, `release date`, and `copyright info` below the `image`.
    A button should also be included on this second view that when tapped fast app switches to the album page in the iTunes store.
    The `button` should be `centered horizontally` and `pinned 20` points from the `bottom` of the view and `20` points from the `leading and trailing` edges of the view. Unlike the first one, this “detail” view controller should `NOT use a UITableView` for layout.
    */
    
    func setupUI() {
        let albumView = UIView()
        let albumArt = UIImageView()
        let albumName = AlbumListLabel(fontSize: 16.0)
        let artistName = AlbumListLabel()
        let genre = AlbumListLabel()
        let releaseDate = AlbumListLabel()
        let copyright = AlbumListLabel()
        let iTunesButton = UIButton()
        
        view.addSubview(albumView)
        albumView.addSubview(albumArt)
        view.addSubview(albumName)
        view.addSubview(artistName)
        view.addSubview(genre)
        view.addSubview(releaseDate)
        view.addSubview(copyright)
        view.addSubview(iTunesButton)
        
        iTunesButton.isHidden = false
        iTunesButton.setTitleColor(.systemBlue, for: .normal)
        genre.text = ""
        releaseDate.text = "Released: "
        
        //albumArt constraints
        albumArt.translatesAutoresizingMaskIntoConstraints = false
        albumArt.topAnchor.constraint(equalTo: view.topAnchor, constant: 10.0).isActive = true
        albumArt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        albumArt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        albumArt.heightAnchor.constraint(equalTo: albumArt.widthAnchor).isActive = true
        //albumName constraints
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.topAnchor.constraint(equalTo: albumView.bottomAnchor).isActive = true
        albumName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        albumName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        albumName.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        //artistName constraints
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.topAnchor.constraint(equalTo: albumName.bottomAnchor).isActive = true
        artistName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        artistName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        artistName.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        //genre constraints
        genre.translatesAutoresizingMaskIntoConstraints = false
        genre.topAnchor.constraint(equalTo: artistName.bottomAnchor).isActive = true
        genre.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        genre.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        genre.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        //releaseDate constraints
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.topAnchor.constraint(equalTo: genre.bottomAnchor).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        releaseDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        releaseDate.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        //iTunesButton
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false
        iTunesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
        iTunesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        iTunesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        //iTunesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
                genre.text = genre.text?.addSuffix(name)
            }
        }
        releaseDate.text = releaseDate.text?.addSuffix(album.releaseDate ?? "")
        copyright.text = album.copyright
    }

}

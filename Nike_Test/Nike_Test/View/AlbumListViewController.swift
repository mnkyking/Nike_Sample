//
//  AlbumListViewController.swift
//  Nike_Test
//
//  Created by Robin G on 5/19/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController {

    let albumTableView = UITableView()
    let loadingIndicator = UIActivityIndicatorView()
    let albumCellId = "albumListCell"
    var albumList: [Album]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let networkService = NetworkService()
        networkService.requestAlbumList { list in
            self.albumList = list
            DispatchQueue.main.async {
                self.navigationController?.navigationBar.topItem?.title = networkService.feedType.uppercased()
                self.albumTableView.isHidden = false
                self.albumTableView.reloadData()
                self.loadingIndicator.stopAnimating()
            }
        }
        setupUI()
    }
    
    func setupUI() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.isHidden = true
        albumTableView.backgroundColor = .white
        albumTableView.register(AlbumListTableViewCell.self, forCellReuseIdentifier: albumCellId)
        
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumTableView)
        let layoutMargins = view.layoutMarginsGuide
        albumTableView.topAnchor.constraint(equalTo: layoutMargins.topAnchor).isActive = true
        albumTableView.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
        albumTableView.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo: layoutMargins.bottomAnchor).isActive = true
        
        loadingIndicator.style = .large
        loadingIndicator.color = .darkGray
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loadingIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicator.startAnimating()
    }
    
}

// MARK: Table View Data Source
extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath) as? AlbumListTableViewCell else {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath)
            return defaultCell
        }
        
        guard let album = albumList?[indexPath.row] else { return cell }
        print("index: \(indexPath.row) album: \(album.name)")
        cell.albumName?.text = album.name
        cell.artistName?.text = album.artistName
        // TODO: possibly add number to the left side to indicate value in Top 100
        if let url = URL(string: album.albumArt ?? "") {
            do {
                let data = try Data(contentsOf: url)
                cell.albumThumbnail?.image = UIImage(data: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        return cell
    }
    
}

// MARK: Table View Delegate
extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         Tapping on a cell should `push` another view controller onto the `navigation stack`
         */
        guard let album = albumList?[indexPath.row] else { return }
        let detailsViewController = DetailsViewController()
        detailsViewController.album = album
        self.navigationController?.present(detailsViewController, animated: true, completion: nil)
    }
}

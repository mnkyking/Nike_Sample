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
    let albumCellId = "albumListCell"
    var albumList: [Album]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let networkService = NetworkService()
        networkService.startRequest()
        setupUI()
    }
    
    func setupUI() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.backgroundColor = .darkGray
        albumTableView.register(AlbumListTableViewCell.self, forCellReuseIdentifier: albumCellId)
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumTableView)
        albumTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        albumTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0).isActive = true
        albumTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        /*
        `Launch View`
        On launch, the user should see a UITableView showing one album per cell.
         */
    }
}

// MARK: Table View Data Source
extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath) as? AlbumListTableViewCell else {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath)
            defaultCell.backgroundColor = .white
            defaultCell.textLabel?.text = String("text \(indexPath.row)")
            return defaultCell
        }
        //cell.albumName?.text = albumList?[indexPath.row].albumTitle
        //cell.artistName?.text = albumList?[indexPath.row].artist
        return cell
    }
}

// MARK: Table View Delegate
extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         Tapping on a cell should `push` another view controller onto the `navigation stack`
         */
        print("selected cell at \(indexPath.row)")
    }
}

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.backgroundColor = .darkGray
        albumTableView.register(UITableViewCell.self, forCellReuseIdentifier: albumCellId)
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumTableView)
        albumTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        albumTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        albumTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        /*
        `Launch View`
        On launch, the user should see a UITableView showing one album per cell.
        Each cell should display the name of the album, the artist, and the album art (thumbnail image).
        Tapping on a cell should `push` another view controller onto the `navigation stack`
         */
    }
}

extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath)
        cell.backgroundColor = .lightGray
        cell.textLabel?.text = String("text \(indexPath.row)")
        return cell
    }
}

extension AlbumListViewController: UITableViewDelegate {

}

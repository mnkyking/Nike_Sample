//
//  AlbumListViewController+TableView.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

// MARK: Table View Data Source
extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath) as? AlbumListTableViewCell else {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath)
            return defaultCell
        }
        let index = indexPath.row
        let name = viewModel.albumName(at: index)
        let artistName = viewModel.artistName(at: index)
        cell.albumName.text = name
        cell.artistName.text = artistName
        // TODO: possibly add number to the left side to indicate value in Top 100
        setImage(for: cell, index: index)
        return cell
    }
    
    private func setImage(for cell: AlbumListTableViewCell, index: Int) {
        cell.albumThumbnail.tag = index
        viewModel.albumImage(at: index) { (pairingIndex, data) in
            if index == pairingIndex {
                cell.albumThumbnail.set(data: data, tag: index)
            }
        }
    }
    
}

// MARK: Table View Delegate
extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         Tapping on a cell should `push` another view controller onto the `navigation stack`
         */
        guard let detailsViewModel = viewModel.detailViewModel(for: indexPath.row) else { return }
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        self.navigationController?.present(detailsViewController, animated: true, completion: nil)
    }
    
}

//
//  AlbumListViewController.swift
//  Nike_Test
//
//  Created by Robin G on 5/19/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

final class AlbumListViewController: UIViewController {

    let albumTableView = UITableView()
    let loadingIndicator = UIActivityIndicatorView()
    let albumCellId = "albumListCell"
    let viewModel: AlbumListViewModel
    
    init(viewModel: AlbumListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.bind { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.navigationController?.navigationBar.topItem?.title = AlbumsService.Constants.feedType.uppercased()
                self.albumTableView.isHidden = false
                self.albumTableView.reloadData()
                self.loadingIndicator.stopAnimating()
            }
        }
        viewModel.fetch()
        setupUI()
    }
    
    private func setupUI() {
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

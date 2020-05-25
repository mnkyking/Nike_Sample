//
//  AlbumListTableViewCell.swift
//  Nike_Test
//
//  Created by Robin G on 5/20/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

class AlbumListTableViewCell: UITableViewCell {
    var albumName: AlbumListLabel?
    var artistName: AlbumListLabel?
    var albumThumbnail: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Setup UI
    func setupUI() {
        albumName = AlbumListLabel(fontSize: 16.0)
        artistName = AlbumListLabel()
        albumThumbnail = UIImageView()
        if let albumName = albumName, let artistName = artistName, let albumThumbnail = albumThumbnail {
            self.backgroundColor = .white
            self.selectionStyle = .none
            contentView.addSubview(albumName)
            contentView.addSubview(artistName)
            contentView.addSubview(albumThumbnail)
            
            //albumThumbnail constraints
            albumThumbnail.translatesAutoresizingMaskIntoConstraints = false
            albumThumbnail.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            albumThumbnail.widthAnchor.constraint(equalTo: albumThumbnail.heightAnchor).isActive = true
            albumThumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
            albumThumbnail.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
            //albumThumbnail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
            //albumName constraints
            albumName.translatesAutoresizingMaskIntoConstraints = false
            albumName.leadingAnchor.constraint(equalTo: albumThumbnail.trailingAnchor, constant: 10.0).isActive = true
            albumName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
            albumName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
            //artistName constraints
            artistName.translatesAutoresizingMaskIntoConstraints = false
            artistName.leadingAnchor.constraint(equalTo: albumThumbnail.trailingAnchor, constant: 10.0).isActive = true
            artistName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
            artistName.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 10.0).isActive = true
            artistName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
        }
    }

}

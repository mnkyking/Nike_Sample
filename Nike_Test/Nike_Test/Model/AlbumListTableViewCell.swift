//
//  AlbumListTableViewCell.swift
//  Nike_Test
//
//  Created by Robin G on 5/20/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit
/*
Each cell should display the name of the album, the artist, and the album art (thumbnail image).
*/
class AlbumListTableViewCell: UITableViewCell {
    var albumName: UILabel?
    var artistName: UILabel?
    var albumThumbnail: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        self.backgroundColor = .lightGray
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
    
    func setupUI() {
        albumName = UILabel()
        artistName = UILabel()
        albumThumbnail = UIImageView()
        if let albumName = albumName, let artistName = artistName, let albumThumbnail = albumThumbnail {
            albumName.textColor = .red
            artistName.textColor = .green
            albumThumbnail.backgroundColor = .orange
            contentView.addSubview(albumName)
            contentView.addSubview(artistName)
            contentView.addSubview(albumThumbnail)
            
            //albumThumbnail constraints
            albumThumbnail.translatesAutoresizingMaskIntoConstraints = false
            albumThumbnail.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
            albumThumbnail.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            albumThumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
            albumThumbnail.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
            albumThumbnail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
            //albumName constraints
            albumName.translatesAutoresizingMaskIntoConstraints = false
            albumName.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
            albumName.leadingAnchor.constraint(equalTo: albumThumbnail.trailingAnchor, constant: 10.0).isActive = true
            albumName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
            albumName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
            //artistName constraints
            artistName.translatesAutoresizingMaskIntoConstraints = false
            artistName.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
            artistName.leadingAnchor.constraint(equalTo: albumThumbnail.trailingAnchor, constant: 10.0).isActive = true
            artistName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
            artistName.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 10.0).isActive = true
        }
    }

}

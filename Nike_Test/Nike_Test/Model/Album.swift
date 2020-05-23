//
//  Album.swift
//  Nike_Test
//
//  Created by Robin G on 5/19/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

//List view
/* Each cell should display the name of the album, the artist, and the album art (thumbnail image). */
//Details View
/* See a larger image at the top of the screen and the same information that was shown on the `cell`, plus `genre`, `release date`, and `copyright info` below the `image`. */
struct Album: Decodable {
    let name: String?
    let artistName: String?
    //let albumArt: Artwork?
    let genres: [Genre]?
    let releaseDate: Date?
    let copyright: String?
}

struct Genre: Decodable {
    let genreId: Int?
    let name: String?
}

//struct Artwork: Decodable {
//
//}

/*
 results =         (
             {
     artistId = 1236267297;
     artistName = Gunna;
     artistUrl = "https://music.apple.com/us/artist/gunna/1236267297?app=music";
     artworkUrl100 = "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/82/db/15/82db15f2-22b2-728a-2a44-ebd7b58b2f9e/810043680837.jpg/200x200bb.png";
     contentAdvisoryRating = Explicit;
     copyright = "\U2117 2020 Young Stoner Life Records / 300 Entertainment";
     genres =                 (
                             {
             genreId = 18;
             name = "Hip-Hop/Rap";
             url = "https://itunes.apple.com/us/genre/id18";
         },
                             {
             genreId = 34;
             name = Music;
             url = "https://itunes.apple.com/us/genre/id34";
         }
     );
     id = 1514490028;
     kind = album;
     name = WUNNA;
     releaseDate = "2020-05-22";
     url = "https://music.apple.com/us/album/wunna/1514490028?app=music";
 },
             {
     artistId = 1159371412;
     artistName = "Polo G";
     artistUrl = "https://music.apple.com/us/artist/polo-g/1159371412?app=music";
     artworkUrl100 = "https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/bc/a4/48/bca44876-54fe-620b-6ba3-be5cd746c59a/886448463481.jpg/200x200bb.png";
     contentAdvisoryRating = Explicit;
     copyright = "\U2117 2020 Columbia Records, a Division of Sony Music Entertainment";
     genres =                 (
                             {
             genreId = 18;
             name = "Hip-Hop/Rap";
             url = "https://itunes.apple.com/us/genre/id18";
         },
                             {
             genreId = 34;
             name = Music;
             url = "https://itunes.apple.com/us/genre/id34";
         }
     );
     id = 1511793475;
     kind = album;
     name = "THE GOAT";
     releaseDate = "2020-05-15";
     url = "https://music.apple.com/us/album/the-goat/1511793475?app=music";
 },
 */

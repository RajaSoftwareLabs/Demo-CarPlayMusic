//
//  MusicStructures.swift
//  Demo-CarPlayMusic
//
//  Created by Kumar Saurav on 11/08/23.
//

import Foundation

// Define a struct for a song containing various
// properties including ID, title, artist, album, and URL
struct Song: Codable {
    var id: Int
    var title: String
    var artist: Artist
    var album: Album
    var url: URL?
}

// Define a struct for an artist with ID and name properties
struct Artist: Codable {
    var id: Int
    var name: String
}

// Define a struct for an album with ID and title properties
struct Album: Codable {
    var id: Int
    var title: String
}

// Create a class to provide helper methods
// for managing music-related structures
class MusicStructureHelpers {
    
    // Create a URL for the 'Cradles' mp3 file
    static let cradlesURL = Bundle.main.url(
        forResource: "Cradles",
        withExtension: "mp3"
    )
    
    // Return an array of default songs, including
    // 'Cradles' by Sub Urban
    static func defaultSongs() -> [Song] {
        return [
            Song(
                id: 0,
                title: "Cradles",
                artist: Artist(id: 0, name: "Sub Urban"),
                album: Album(id: 0, title: "Single"),
                url: cradlesURL
            )
        ]
    }

    // Return an array containing an error indicating
    // that something went wrong
    static func error() -> [Song] {
        return [
            Song(
                id: 101,
                title: "Something went wrong.",
                artist: Artist(id: 101, name: ""),
                album: Album(id: 101, title: "")
            ),
        ]
    }
}


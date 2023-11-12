//
//  Model.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 09.11.2023.
//

import UIKit

struct Album {
    let image: String
    let title: String
    var count: String {
        String(photos.count)
    }
    let photos: [String]
}

struct AlbumsGroup {
    let title: String
    let count: String
    let albums: [Album]
}

extension AlbumsGroup {
    static func allGroups() -> [AlbumsGroup] {
        return [getMyAlbumGroup(), getPeopleGroup(), getMediaTypes()]
    }
    static func getMyAlbumGroup() -> AlbumsGroup {
        let photos = [
            Album(image: "1", title: "Recents", photos: ["1", "2", "3", "4", "3", "4"]),
            Album(image: "2", title: "WhatsApp Images", photos: ["1", "2", "3", "4", "1", "2", "3", "4"]),
            Album(image: "3", title: "WhatsApp", photos: ["1", "2", "3", "4"]),
            Album(image: "1", title: "Favorites", photos: ["1", "2", "3", "4"]),
            Album(image: "2", title: "WhatsApp Images", photos: ["1", "2", "3", "4"]),
            Album(image: "3", title: "WhatsApp", photos: ["1", "2", "3", "4"]),
            Album(image: "1", title: "Favorites",photos: ["1", "2", "3", "4"]),
            Album(image: "2", title: "Images", photos: ["1", "2", "3", "4"]),
        ]
        let count  = String(photos.count)
        return AlbumsGroup(title: "My Albums", count: count, albums: photos)
    }
    
    static func getPeopleGroup() -> AlbumsGroup {
        let photos = [
            Album(image: "1", title: "People",  photos: ["1", "2", "3", "4", "1", "2", "3", "4"]),
            Album(image: "2", title: "Places",  photos: ["1", "2", "3", "4"])
        ]
        let count  = String(photos.count)
        return AlbumsGroup(title: "People & Places", count: count, albums: photos)
    }
    
    static func getMediaTypes() -> AlbumsGroup {
        let mediaTypes = [
            Album(image: "video", title: "Videos", photos: ["1", "2", "3", "4"]),
            Album(image: "person.crop.rectangle", title: "Selfies", photos: ["1", "2", "3", "4"]),
            Album(image: "smallcircle.circle", title: "Live Photos",  photos: ["1", "2", "3", "4"])
        ]
        let count = String(mediaTypes.count)
        return AlbumsGroup(title: "Media Types", count: count, albums: mediaTypes)
    }
}

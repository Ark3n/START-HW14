//
//  Model.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 09.11.2023.
//

import UIKit

struct Photo {
    let image: String
    let title: String
    let count: String
}

struct AlbumsGroup {
    let title: String
    let count: String
    let albums: [Photo]
}

extension AlbumsGroup {
    static func allGroups() -> [AlbumsGroup] {
        return [getMyAlbumGroup(), getPeopleGroup(), getMediaTypes()]
    }
    static func getMyAlbumGroup() -> AlbumsGroup {
        let photos = [
            Photo(image: "1", title: "Recents", count: "3500"),
            Photo(image: "2", title: "WhatsApp Images", count: "56"),
            Photo(image: "3", title: "WhatsApp", count: "350"),
            Photo(image: "1", title: "Favorites", count: "100"),
            Photo(image: "2", title: "WhatsApp Images", count: "56"),
            Photo(image: "3", title: "WhatsApp", count: "350"),
            Photo(image: "1", title: "Favorites", count: "100"),
            Photo(image: "2", title: "Images", count: "3500"),
        ]
        let count  = String(photos.count)
        return AlbumsGroup(title: "myAlbum", count: count, albums: photos)
    }
    
    static func getPeopleGroup() -> AlbumsGroup {
        let photos = [
            Photo(image: "1", title: "People", count: "3500"),
            Photo(image: "2", title: "Places", count: "56"),
            Photo(image: "1", title: "People", count: "3500"),
            Photo(image: "2", title: "Places", count: "56")
        ]
        let count  = String(photos.count)
        return AlbumsGroup(title: "People&Places", count: count, albums: photos)
    }
    
    static func getMediaTypes() -> AlbumsGroup {
        let mediaTypes = [
            Photo(image: "video", title: "Videos", count: "145"),
            Photo(image: "person.crop.rectangle", title: "Selfies", count: "234"),
            Photo(image: "smallcircle.circle", title: "Live Photos", count: "123")
        ]
        let count = String(mediaTypes.count)
        return AlbumsGroup(title: "Media Types", count: count, albums: mediaTypes)
    }
}

//
//  Model.swift
//  START-HW14-Arken
//
//  Created by Arken Sarsenov on 09.11.2023.
//

import UIKit

struct Photo {
    let image: String
}

struct AlbumsGroup {
    let title: String
    let count: String
    let photos: [Photo]
}

extension AlbumsGroup {
    static func allGroups() -> [AlbumsGroup] {
        return [getMyAlbumGroup(), getPeopleGroup()]
    }
    static func getMyAlbumGroup() -> AlbumsGroup {
        let photos = [Photo(image: "1"), Photo(image: "2"), Photo(image: "3"), Photo(image: "4"), Photo(image: "1"), Photo(image: "2"), Photo(image: "3"), Photo(image: "4")]
        let count  = String(photos.count)
        return AlbumsGroup(title: "myAlbum", count: count, photos: photos)
    }
    
    static func getPeopleGroup() -> AlbumsGroup {
        let photos = [Photo(image: "5"), Photo(image: "6"), Photo(image: "7"), Photo(image: "8")]
        let count  = String(photos.count)
        return AlbumsGroup(title: "People&Places", count: count, photos: photos)
    }
}

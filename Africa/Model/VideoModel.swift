//
//  VideoModel.swift
//  Africa
//
//  Created by Владимир Ширяев on 14.09.2021.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    
    // Computer property
    var thumbnail:String {
        "video-\(id)"
    }
}

//
//  LocationModel.swift
//  Africa
//
//  Created by Владимир Ширяев on 18.09.2021.
//

import Foundation
import MapKit

struct NationParkLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    // Computer property
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}

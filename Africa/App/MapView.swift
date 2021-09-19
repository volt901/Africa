//
//  MapView.swift
//  Africa
//
//  Created by Владимир Ширяев on 30.08.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    } ()
    
    let location: [NationParkLocation] = Bundle.main.decode("locations.json")
    //MARK: - Body
    var body: some View {
        // MARK: - No1 Basic map
        //Map(coordinateRegion: $region)
        
        // MARK: -No2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: location, annotationContent: { item in
            // (A) PIN: OLD STYLE
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARCER: NEW STYLE
           // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30, alignment: .center)
            
            // (D) CUSTOM
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        })//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack {
                        Text ("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text ("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }
                    Divider()
                    HStack {
                        Text ("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text ("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }
                    
                    
                }
                
            }//: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal,16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            ,alignment: .top
        )
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

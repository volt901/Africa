//
//  GalleryView.swift
//  Africa
//
//  Created by Владимир Ширяев on 30.08.2021.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

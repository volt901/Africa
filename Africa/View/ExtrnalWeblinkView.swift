//
//  ExtrnalWeblinkView.swift
//  Africa
//
//  Created by Владимир Ширяев on 13.09.2021.
//

import SwiftUI

struct ExtrnalWeblinkView: View {
    let animal : Animal
    
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "http://wikipedia.org"))!)
                }.foregroundColor(.accentColor)
            }//: Hstack
        }//: Box
        
    }
}

struct ExtrnalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExtrnalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  ContentView.swift
//  Africa
//
//  Created by Владимир Ширяев on 30.08.2021.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridColums: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: -FUNC
    func gridSwithc () {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
        gridColums = gridLayout.count
        print ("Grid Number: \(gridColums)")
        
        // TOOLBAR IMAGE
        switch gridColums {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    var body: some View {
        // MARK: - Properties

        
        // MARK: - Body
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) {animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }// : Link
                        } //: LOOP
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal)){
                                        AnimalGridItemView(animal: animal)
                                    }//: LINK
                            }//: LOOP
                        } //: GRID
                        .padding()
                        .animation(.easeIn)
                    }//: SCROLL
                }// : List
            } //: GROUP
            
            
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16){
                        //: LIST
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptic.impactOccurred()
                        }){
                            Image (systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // GRID
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptic.impactOccurred()
                            gridSwithc()
                        }){
                            Image (systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                        
                        
                        
                    }//: HSTACK
                } //: BUTTONS
            } //: TOOLBAR

        }//: Navigator
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

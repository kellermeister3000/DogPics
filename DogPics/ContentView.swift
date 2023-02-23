//
//  ContentView.swift
//  DogPics
//
//  Created by Philip Keller on 2/23/23.
//

import SwiftUI

struct ContentView: View {
    enum Breed: String, CaseIterable {
        case boxer, bulldog, chihuahua, corgi, labradoodle, poodle, pug, retriever
    }
    
    @StateObject var dogVM = DogViewModel()
    @State private var selectedBreed: Breed = .boxer
    
    var body: some View {
        VStack {
            Text("🐶 Dog Pics!")
                .font(Font.custom("Avenir Next Condensed", size: 60))
                .bold().foregroundColor(.brown)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            Button("Any Random Dog") {
                Task {
                    await dogVM.getData()
                }
                
            }
            .buttonStyle(.borderedProminent)
            .bold()
            .tint(.brown)
            .padding(.bottom)
            
            HStack {
                Button("Show Breed") {
                    
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
                
                Picker("", selection: $selectedBreed) {
                    ForEach(Breed.allCases, id: \.self) { breed in
                        Text(breed.rawValue.capitalized)
                            
                    }
                }
            }
            .bold()
            .tint(.brown)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

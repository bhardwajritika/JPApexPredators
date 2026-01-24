//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Tarun Sharma on 23/01/26.
//

import SwiftUI

struct ContentView: View {
    
    let predators = Predators()
    
    var body: some View {
        NavigationStack {
            
            List(predators.apexPredators) { predator in
                NavigationLink {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label: {
                    HStack {
                        // Image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack (alignment: .leading) {
                            // name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            
                            // type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.backgroundColor)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle(Text("Apex Predators"))
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

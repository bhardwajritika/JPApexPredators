//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Tarun Sharma on 28/01/26.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator: ApexPredatorModel
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView () {
                ZStack (alignment: .bottomTrailing) {
                    // Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [
                                Gradient.Stop (color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                            ] , startPoint: .top, endPoint: .bottom)
                            
                        }
                        
                    
                    // dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y : 20)
                    
                    
                }
                
                VStack (alignment: .leading) {
                    // Name of dino
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    
                    // current location
                    
                    // Appear in
                    Text("Appears in: ")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("• " + movie)
                            
                    }
                    
                    // movie moments
                    Text("Movie Moments:  ")
                        .font(.title)
                        .padding(.top, 15)
                    ForEach(predator.movieScenes) {
                      movie in
                        Text(movie.movie)
                            .font(.title2)
                            .padding(.vertical, 2)
                        
                        Text(movie.sceneDescription)
                            .padding(.bottom, 10)
                    }
                    
                    // link to webpage
                    Text("Read more: ")
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .padding(.bottom)
                    
                }.padding()
                .frame(width: geo.size.width, alignment: .leading)
                
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().allApexPredators[7])
        .preferredColorScheme(.dark)
}

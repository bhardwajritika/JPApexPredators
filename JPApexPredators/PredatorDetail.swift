//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Tarun Sharma on 28/01/26.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    
    let predator: ApexPredatorModel
    @State var position: MapCameraPosition
    
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
                        .clipShape(.rect(cornerRadius: 15))
                    
                    
                    
                    // current location
                    NavigationLink {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit( )
                    } label: {
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location){
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                        .frame(height: 125)
                        
                        .overlay(alignment: .trailing) {
                            Image(systemName: "chevron.right")
                                .imageScale(.large)
                                .padding(.trailing, 5)
                        }
                        .overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.leading, .bottom], 4)
                                .padding(.trailing, 8)
                                .background(Color.black.opacity(0.4))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        }
                        .clipShape(.rect(cornerRadius: 15))
                    }
                   
                        
                    
                    // Appear in
                    Text("Appears in: ")
                        .font(.title3)
                        .padding(.top, 15)
                        
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
                        .foregroundColor(.blue)
                    
                }.padding()
                .frame(width: geo.size.width, alignment: .leading)
                
                
            }
        }
        .ignoresSafeArea()
        .toolbarBackground(.automatic)
    }
}

#Preview {
    let predator = Predators().allApexPredators[7]
    
    NavigationStack {
        PredatorDetail(predator: predator, position: .camera(
            MapCamera(centerCoordinate: predator.location,
                      distance: 30000
                     )))
        .preferredColorScheme(.dark)
    }
    
}

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
            ScrollView {
                ZStack (alignment: .bottomTrailing) {
                    // Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    // dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y : 20)
                    
                    
                }
                
                // Name of dino
//                Text(predator.name)
                
                // current location
                
                // Appear in
                
                // movie moments
                
                // link to webpage
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().allApexPredators[2])
}

//
//  ApexPredatorModel.swift
//  JPApexPredators
//
//  Created by Tarun Sharma on 23/01/26.
//

import Foundation
import SwiftUI

struct ApexPredatorModel : Decodable, Identifiable {
    let id : Int
    let name : String
    let type : apexType
    let latitude : Double
    let longitude : Double
    let movieScenes : [movieScene]
    let link : String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct movieScene : Decodable {
        let id : Int
        let movie : String
        let sceneDescription : String
    }
    
    enum apexType : String, Decodable {
        case land
        case air
        case sea
        
        var backgroundColor : Color {
            switch self {
            case .land:
                 return .brown
            case .air:
                return .teal
            case .sea:
                return .blue
            }
        }
        
    }
}

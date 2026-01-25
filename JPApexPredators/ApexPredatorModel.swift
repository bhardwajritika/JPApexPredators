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
    
    
}

enum apexType : String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: apexType {
        self
    }
    
    var backgroundColor : Color {
        switch self {
        case .land:
            return .brown
        case .air:
            return .teal
        case .sea:
            return .blue
        case .all:
            return .black
        }
    }
    
    var icon: String {
        switch self {
        case .land:
            return "leaf.fill"
        case .air:
            return "wind"
        case .sea:
            return "drop.fill"
        case .all:
            return "square.stack.3d.up.fill"
        }
    }
    
}

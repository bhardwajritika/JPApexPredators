//
//  ApexPredatorModel.swift
//  JPApexPredators
//
//  Created by Tarun Sharma on 23/01/26.
//

import Foundation

struct ApexPredatorModel : Decodable {
    let id : Int
    let name : String
    let type : String
    let latitude : Double
    let longitude : Double
    let movieScenes : [movieScene]
    let link : String
    
    struct movieScene : Decodable {
        let id : Int
        let movie : String
        let sceneDescription : String
    }
}

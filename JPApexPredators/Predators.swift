//
//  Predators.swift
//  JPApexPredators
//
//  Created by Tarun Sharma on 23/01/26.
//

import Foundation

class Predators {
    
    var apexPredators: [ApexPredatorModel] = []
    
    init() {
        decodeApexPredators()
    }
    
    
    func decodeApexPredators() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredatorModel].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}

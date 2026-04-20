//
//  Model.swift
//  DemoUIkit2
//
//  Created by Hammad Ali on 20/04/2026.
//

import Foundation

struct Model {
    let name : String
    let description : String
    let image : String
    let price : String
    
    init(name: String, description: String, image: String, price: String) {
        self.name = name
        self.description = description
        self.image = image
        self.price = price
    }
}

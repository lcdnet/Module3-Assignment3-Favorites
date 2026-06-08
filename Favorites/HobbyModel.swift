//
//  CityModel.swift
//  Favorites
//
//  Created by Levi Daniel on 6/6/26.
//

import Foundation

// Each instance must be different in id, cityName, and cityImage.
struct CityModel : Identifiable {
    
    let id: Int
    let cityName : String
    let cityImage : String
    
    var isFavorite : Bool = false // mutable by user.
    
    
}

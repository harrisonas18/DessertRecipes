//
//  RecipeModel.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation

struct RecipeModel: Codable, Identifiable {
    
    var id = UUID()
    var recipeID: String
    var recipeName: String
    var recipeThumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case recipeID = "idMeal"
        case recipeName = "strMeal"
        case recipeThumbnailURL = "strMealThumb"
    }
    
}

struct Recipes: Codable {
    var meals: [RecipeModel]
}





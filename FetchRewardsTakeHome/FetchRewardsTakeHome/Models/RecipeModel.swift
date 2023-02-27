//
//  RecipeModel.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation

struct RecipeModel: Codable, Identifiable {
    
    let id = UUID()
    let recipeID: String
    let recipeName: String
    let recipeThumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case recipeID = "idMeal"
        case recipeName = "strMeal"
        case recipeThumbnailURL = "strMealThumb"
    }
    
}

struct Recipes: Codable {
    let meals: [RecipeModel]
}





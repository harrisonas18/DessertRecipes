//
//  RecipeDetailModel.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation

struct RecipeDetailModel: Codable, Identifiable {
    
    let id = UUID()
    let recipeID: String
    let recipeName: String
    let recipeThumbnailURL: String
    let instructions: String
    
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var ingredient16: String?
    var ingredient17: String?
    var ingredient18: String?
    var ingredient19: String?
    var ingredient20: String?
    
    var measurement1: String?
    var measurement2: String?
    var measurement3: String?
    var measurement4: String?
    var measurement5: String?
    var measurement6: String?
    var measurement7: String?
    var measurement8: String?
    var measurement9: String?
    var measurement10: String?
    var measurement11: String?
    var measurement12: String?
    var measurement13: String?
    var measurement14: String?
    var measurement15: String?
    var measurement16: String?
    var measurement17: String?
    var measurement18: String?
    var measurement19: String?
    var measurement20: String?
    
    
    enum CodingKeys: String, CodingKey {
        case recipeID = "idMeal"
        case recipeName = "strMeal"
        case recipeThumbnailURL = "strMealThumb"
        case instructions = "strInstructions"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        
        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
        case measurement16 = "strMeasure16"
        case measurement17 = "strMeasure17"
        case measurement18 = "strMeasure18"
        case measurement19 = "strMeasure19"
        case measurement20 = "strMeasure20"
    }
    
    
    func byPropertyName(name: String) -> String {
        switch name {
        case "ingredient1": return ingredient1 ?? ""
        case "ingredient2": return ingredient2 ?? ""
        case "ingredient3": return ingredient3 ?? ""
        case "ingredient4": return ingredient4 ?? ""
        case "ingredient5": return ingredient5 ?? ""
        case "ingredient6": return ingredient6 ?? ""
        case "ingredient7": return ingredient7 ?? ""
        case "ingredient8": return ingredient8 ?? ""
        case "ingredient9": return ingredient9 ?? ""
        case "ingredient10": return ingredient10 ?? ""
        case "ingredient11": return ingredient11 ?? ""
        case "ingredient12": return ingredient12 ?? ""
        case "ingredient13": return ingredient13 ?? ""
        case "ingredient14": return ingredient14 ?? ""
        case "ingredient15": return ingredient15 ?? ""
        case "ingredient16": return ingredient16 ?? ""
        case "ingredient17": return ingredient17 ?? ""
        case "ingredient18": return ingredient18 ?? ""
        case "ingredient19": return ingredient19 ?? ""
        case "ingredient20": return ingredient20 ?? ""
        
        case "measurement1": return measurement1 ?? ""
        case "measurement2": return measurement2 ?? ""
        case "measurement3": return measurement3 ?? ""
        case "measurement4": return measurement4 ?? ""
        case "measurement5": return measurement5 ?? ""
        case "measurement6": return measurement6 ?? ""
        case "measurement7": return measurement7 ?? ""
        case "measurement8": return measurement8 ?? ""
        case "measurement9": return measurement9 ?? ""
        case "measurement10": return measurement10 ?? ""
        case "measurement11": return measurement11 ?? ""
        case "measurement12": return measurement12 ?? ""
        case "measurement13": return measurement13 ?? ""
        case "measurement14": return measurement14 ?? ""
        case "measurement15": return measurement15 ?? ""
        case "measurement16": return measurement16 ?? ""
        case "measurement17": return measurement17 ?? ""
        case "measurement18": return measurement18 ?? ""
        case "measurement19": return measurement19 ?? ""
        case "measurement20": return measurement20 ?? ""
        default:
            fatalError("Wrong property name")
        }
    }
    
}

struct RecipeDetail: Codable {
    let meals: [RecipeDetailModel]
}

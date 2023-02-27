//
//  RecipeListViewModel.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation
import SwiftUI

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipes = [RecipeModel]()
    @Published var recipeDetail = [String : RecipeDetailModel]()
    @Published var isLoading = false
    private let sharedNetwork = NetworkAPI.shared
    
    func fetchRecipes() async {
        let unsortedRecipes = await sharedNetwork.fetchRecipeListData(dataURLString: sharedNetwork.recipeListURL)
        recipes = unsortedRecipes.sorted { $0.recipeName < $1.recipeName }
    }
    
    func fetchRecipeDetail() async {
        for recipe in recipes {
            recipeDetail[recipe.recipeID] = await sharedNetwork.fetchRecipeDetailData(recipeID: recipe.recipeID)
        }
    }
    
}


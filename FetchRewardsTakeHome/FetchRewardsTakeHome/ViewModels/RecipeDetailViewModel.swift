//
//  RecipeDetailViewModel.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation
import SwiftUI

@MainActor
class RecipeDetailViewModel: ObservableObject {
    
    @Published var recipeImage = UIImage()
    @Published var recipeDetail: RecipeDetailModel?
    private let cache = ImageCache.shared
    private let network = NetworkAPI.shared
    
    func fetchImage(recipe: RecipeModel) async {
        recipeImage = await cache.retrievePhoto(recipe: recipe)
    }
    
    func fetchRecipeDetail(recipeID: String) async {
        recipeDetail = await network.fetchRecipeDetailData(recipeID: recipeID)
    }
}

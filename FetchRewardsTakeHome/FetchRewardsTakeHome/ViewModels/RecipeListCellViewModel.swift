//
//  RecipeListCellViewModel.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation
import SwiftUI

@MainActor
class RecipeListCellViewModel: ObservableObject {
    
    @Published var image = UIImage()
    private let cache = ImageCache.shared
    
    func fetchImage(recipe: RecipeModel) async {
        image = await cache.retrievePhoto(recipe: recipe)
    }
    
}

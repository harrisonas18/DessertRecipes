//
//  RecipeListWrapper.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/26/23.
//

import Foundation

class RecipeListWrapper: NSObject {
    
    let recipeList: [RecipeModel]
    
    init(recipeList: [RecipeModel]) {
        self.recipeList = recipeList
    }
    
}

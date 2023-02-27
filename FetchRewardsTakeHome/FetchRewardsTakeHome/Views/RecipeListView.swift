//
//  RecipeListView.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var vm = RecipeListViewModel()
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    @MainActor
    var body: some View {
        ScrollView {
            if vm.isLoading {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 4 + 50)
                ProgressView()
            } else {
                LazyVGrid(columns: columns, alignment: .center, spacing: 4) {
                    ForEach((vm.recipes), id: \.id) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                                .navigationTitle(recipe.recipeName)
                        } label: {
                            RecipeListCellView(recipe: recipe)
                        }
                    }
                }
            }
        }
        .task {
            vm.isLoading = true
            await vm.fetchRecipes()
            await vm.fetchRecipeDetail()
            vm.isLoading = false
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}

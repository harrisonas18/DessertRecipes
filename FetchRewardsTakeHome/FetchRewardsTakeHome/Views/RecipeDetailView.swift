//
//  RecipeDetailView.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @StateObject var vm = RecipeDetailViewModel()
    @State var recipe: RecipeModel
    
    @MainActor
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                Image(uiImage: vm.recipeImage)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 480, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .task {
                        await vm.fetchImage(recipe: recipe)
                    }
                VStack(spacing: 16) {
                    Text("Instructions")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Text(vm.recipeDetail?.instructions ?? "")
                    Divider()
                }
                VStack(spacing: 16){
                    Text("Ingredients")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    VStack {
                        ForEach(0..<20) { num in
                            VStack {
                                HStack(alignment: .center){
                                    if !(vm.recipeDetail?.byPropertyName(name: "ingredient\(num + 1)").isEmpty ?? false) {
                                        Text("Ingredient: \(vm.recipeDetail?.byPropertyName(name: "ingredient\(num + 1)") ?? "")")
                                        Spacer()
                                        Text("\(vm.recipeDetail?.byPropertyName(name: "measurement\(num + 1)") ?? "")")
                                    }
                                }
                                if !(vm.recipeDetail?.byPropertyName(name: "ingredient\(num + 1)").isEmpty ?? false) {
                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .task {
            await vm.fetchRecipeDetail(recipeID: recipe.recipeID)
        }
    }
}

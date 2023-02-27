//
//  RecipeListCellView.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import SwiftUI

struct RecipeListCellView: View {
    
    @StateObject var vm = RecipeListCellViewModel()
    @State var recipe: RecipeModel
    
    @MainActor
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 8){
                Image(uiImage: vm.image)
                    .resizable()
                    .frame(width: 72, height: 72, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(36)
                    .overlay(
                        RoundedRectangle(cornerRadius: 36)
                            .stroke(Color("ImageBorderColor"), lineWidth: 2)
                        )
                    .task {
                       await vm.fetchImage(recipe: recipe)
                    }
                Text(recipe.recipeName)
                    .font(.system(size: 18))
                    .foregroundColor(Color("ImageBorderColor"))
                Spacer()
            }
            .padding()
            Divider()
        }
        
    }
}

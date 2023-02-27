//
//  ContentView.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            RecipeListView()
                .navigationTitle("Dessert Recipes")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

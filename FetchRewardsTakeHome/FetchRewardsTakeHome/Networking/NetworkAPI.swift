//
//  NetworkAPI.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation

@MainActor
class NetworkAPI: NSObject {
    
    static let shared = NetworkAPI()
    let recipeListURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let session = URLSession.shared
    private let recipeCache = NSCache<NSString, RecipeListWrapper>()
    private let detailCache = NSCache<NSString, RecipeDetailWrapper>()
    private let recipeCacheKey = "Dessert"
    private let recipeListFileName = "desserts.json"
    private let json = ".json"
    
    func fetchRecipeListData(dataURLString: String) async -> [RecipeModel] {
        if let recipeList = recipeCache.object(forKey: recipeCacheKey as NSString) {
            return recipeList.recipeList
        }
        guard let url = URL(string: dataURLString) else {
            return []
        }
        //Check to see if file exists in caches directory before fetching from network
        if fileExists(nameOfFile: recipeListFileName) {
            //Yes file exists, fetch from disk and parse, save to memory and return
            do {
                //File exists in cache directory retrieve from local storage
                let cacheDirectory = getCacheDirectoryPath()
                let url = cacheDirectory.appending(path: recipeListFileName)
                let data = try Data(contentsOf: url)
                let recipes = try JSONDecoder().decode(Recipes.self, from: data)
                recipeCache.setObject(RecipeListWrapper(recipeList: recipes.meals), forKey: recipeCacheKey as NSString)
                return recipes.meals
            } catch let error as NSError {
                //TODO: Throw error to UI
                print("Error Fetching Recipe List JSON: ", error)
                return []
            }
        } else {
            //No, fetch from network, save to disk, parse, save to memory, return parsed object
            let cacheDir = getCacheDirectoryPath()
            do {
                let (data, _) = try await session.data(from: url)
                let url = cacheDir.appending(path: recipeListFileName)
                try data.write(to: url)
                let recipes = try JSONDecoder().decode(Recipes.self, from: data)
                recipeCache.setObject(RecipeListWrapper(recipeList: recipes.meals), forKey: recipeCacheKey as NSString)
                return recipes.meals
            } catch let error as NSError {
                //TODO: Throw error to UI so the user knows something has gone wrong.
                print("Error Fetching Recipe List JSON: ", error)
                return []
            }
        }

    }
    
    func fetchRecipeDetailData(recipeID: String) async -> RecipeDetailModel? {
        
        if let recipe = detailCache.object(forKey: recipeID as NSString) {
            return recipe.recipeDetail
        }
        let fileName = recipeID + json
        if fileExists(nameOfFile: fileName) {
            //Yes file exists, fetch from disk and parse, save to memory and return
            do {
                //File exists in cache directory retrieve from local storage
                let cacheDirectory = getCacheDirectoryPath()
                let url = cacheDirectory.appending(path: fileName)
                let data = try Data(contentsOf: url)
                let recipe = try JSONDecoder().decode(RecipeDetail.self, from: data)
                if let recipeDetail = recipe.meals.first {
                    detailCache.setObject(RecipeDetailWrapper(recipeDetail: recipeDetail),
                                          forKey: recipeID as NSString)
                }
                return recipe.meals.first
            } catch let error as NSError {
                //TODO: Throw error to UI
                print("Error Fetching Recipe Details JSON: ", error)
                return nil
            }
        } else {
            //No, fetch from network, save to disk, parse, save to memory, return parsed object
            let detailURLString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(recipeID)"
            guard let url = URL(string: detailURLString) else {
                return nil
            }
            let cacheDir = getCacheDirectoryPath()
            do {
                let (data, _) = try await session.data(from: url)
                let url = cacheDir.appending(path: fileName)
                try data.write(to: url)
                let recipe = try JSONDecoder().decode(RecipeDetail.self, from: data)
                if let recipeDetail = recipe.meals.first {
                    detailCache.setObject(RecipeDetailWrapper(recipeDetail: recipeDetail),
                                          forKey: recipeID as NSString)
                }
                return recipe.meals.first
            } catch let error as NSError {
                //TODO: Throw error to UI so the user knows something has gone wrong.
                print("Error Fetching Recipe Details JSON: ", error)
                return nil
            }
        }
        
    }
    
    //Check to see if file exists at specified caches url
    private func fileExists(nameOfFile: String) -> Bool {
        let path = getCacheDirectoryPath()
        let url = path.appending(path: nameOfFile).relativePath
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: url) {
            return true
        } else {
            return false
        }
    }
    
    // Get user's cache directory path
    private func getCacheDirectoryPath() -> URL {
        let arrayPaths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        let cacheDirectoryPath = arrayPaths[0]
        return cacheDirectoryPath
    }
    
}

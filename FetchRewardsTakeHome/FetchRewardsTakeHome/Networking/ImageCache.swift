//
//  ImageCache.swift
//  FetchRewardsTakeHome
//
//  Created by Harrison Senesac on 2/25/23.
//

import Foundation
import UIKit

@MainActor
class ImageCache: NSObject, ObservableObject {
    
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    private let session = URLSession.shared
    private let placeholder = UIImage(named: "ProfileImagePlaceholder") ?? UIImage()
    
    public func retrievePhoto(recipe: RecipeModel) async -> UIImage {
        let id = recipe.recipeID
        //1. If UIImage with id exists in NSCache, return UIImage
        if let photo = cache.object(forKey: id as NSString){
            return photo
        }
        //2. No UIImage exists in NSCache, check to see if file URL exists in cache directory.
        if fileExists(nameOfFile: id){
            do {
                //File exists in cache directory retrieve from local storage
                let cacheDirectory = getCacheDirectoryPath()
                let url = cacheDirectory.appending(path: "\(id).jpeg")
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else { return placeholder }
                cache.setObject(image, forKey: id as NSString)
                return image
            } catch let error as NSError {
                //TODO: Throw error to UI
                print("Error fetching image from disk cache: ", error)
                return placeholder
            }
        } else {
            // If photo doesnt exist Fetch from network
            // Call saveImageToCache() to download to disk
            let remoteImageURL = recipe.recipeThumbnailURL
            let image = await saveImageToCache(recipeID: id, remoteImageURL: remoteImageURL)
            return image
        }
        
        
    }
    
    private func saveImageToCache(recipeID: String, remoteImageURL: String) async -> UIImage {

        guard let remoteImageURL = URL(string: remoteImageURL) else { return UIImage() }
        let cacheDir = getCacheDirectoryPath()

        do {
            let (fileURL, _) = try await session.download(from: remoteImageURL)
            let data = try Data(contentsOf: fileURL)
            let url = cacheDir.appending(path: "\(recipeID).jpeg")
            try data.write(to: url)
            guard let image = UIImage(data: data) else { return UIImage() }
            cache.setObject(image, forKey: recipeID as NSString)
            return image
        } catch let error as NSError {
            //TODO: Throw error to UI
            print("Error with saving image to cache: ", error)
            return placeholder
        }
        
    }

    //Check to see if file exists at specified caches url
    private func fileExists(nameOfFile: String) -> Bool {
        let path = getCacheDirectoryPath()
        let url = path.appending(path: "\(nameOfFile).jpeg").relativePath
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

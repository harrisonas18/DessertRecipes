# DessertRecipes
### Description
Download and browse a list of dessert recipes. 100% Native Swift with no dependencies.

## Fetch Rewards Take Home Test

App utilizes 2 endpoints to retrieve a list of dessert recipes and the details of each recipe located at:

Endpoint for fetching the list of meals in the Dessert category.

1. https://themealdb.com/api/json/v1/1/filter.php?c=Dessert 

Endpoint for fetching the meal details by its ID. Replace "MEAL_ID" with the meal id you would like details of.

2. https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID 

### How to run
Clone, Build & Run

OR

Download Zip, Extract, Build, & Run

### UI Design
I used SwiftUI to create the UI. Using SwiftUI with previews makes UI iteration much faster. In addition, coupling SwiftUI with an MVVM architecture produces cleaner and easier-to-read code.

### Architecture
Network API - The network api houses the logic to request and cache network requests to the endpoints used above. Downloaded network data, and objects parsed from the JSON data, are written to disk and in memory caches respectively. This prevents unneeded network requests when the user launches the app again. Creating a smoother functioning UI and better UX.

Image Cache - The image cache houses the logic to download and store all the image UIImage objects and corresponding data. Image data is written to the app cache via the file system and UIImage objects are written to an NSCache for in memory usage. Writing to both disk and in memory caches prevents unneeded network requests and makes subsequent loads much faster.

### Trade Offs
The biggest trade off I made was downloading and caching all data for the app on the first launch. This will create a slower first launch which could be optimized but I left as is for the exercise. All subsequent launches however will be very fast. Further, for this particular exercise I sacrificed some modularity to save time. There are also some spots where code could be refactored to reduce repetitive use. Model objects could have been refactored to be more dynamic and flexible in case endpoint structure changed in the future.


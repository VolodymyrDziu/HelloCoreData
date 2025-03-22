//  HelloCoreData
//
//  Created by Volodymyr Dziubenko on 21.03.2025.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreModel")
        persistentContainer.loadPersistentStores{(description, error)in
            if let error = error {
                fatalError("CoreData store failed\(error.localizedDescription)")
            }
        }
    }
    
    func updateMovie(){
        do {
            try persistentContainer.viewContext.save()
        }catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save movie\(error)")
        }
    }
    
    func deleteMovie(movie: Movie){
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save movie\(error)")
          }
    }
    
    func getAllMovie() -> [Movie] {
       
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
           return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
          }
    }
    
    func saveMovie(title: String){
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do {
           try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie\(error)")
          }
    }
    
    
    
    
}

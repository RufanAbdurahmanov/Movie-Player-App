//
//  CoreDataHelper.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 20.06.22.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func insertDownloadTrailersData(movieName: String, trailerName: String, trailerPath: String) {
        let downloadedTrailerModel = DownloadedTrailers(context: context)
        
        downloadedTrailerModel.movieName = movieName
        downloadedTrailerModel.trailerName = trailerName
        downloadedTrailerModel.trailerPath = trailerPath
        
        do {
            try self.context.save()
        } catch {
            print("error")
        }
    }
    
    func fetchDownloadedTrailers() -> [DownloadedTrailerModel]? {
        
        var trailers = [DownloadedTrailerModel]()
        
        do {
            let items = try self.context.fetch(DownloadedTrailers.fetchRequest())
            for item in items {
                trailers.append(DownloadedTrailerModel(movieName: item.movieName, trailerName: item.trailerName, trailerPath: item.trailerPath))
            }
            return trailers
        } catch {
            print("Fetch error: \(error.localizedDescription)")
        }
        return nil
    }
}

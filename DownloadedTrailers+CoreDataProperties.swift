//
//  DownloadedTrailers+CoreDataProperties.swift
//  
//
//  Created by Rufan Abdurahmanov on 02.07.22.
//
//

import Foundation
import CoreData


extension DownloadedTrailers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DownloadedTrailers> {
        return NSFetchRequest<DownloadedTrailers>(entityName: "DownloadedTrailers")
    }

    @NSManaged public var movieName: String?
    @NSManaged public var trailerName: String?
    @NSManaged public var trailerPath: String?

}

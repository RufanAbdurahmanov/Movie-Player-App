//
//  DownloadsViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 21.06.22.
//

import Foundation

class DownloadsViewModel {
    
    var downloadedTrailers = [DownloadedTrailerModel]()
    
    init() {}
    
    func fetchTrailersFromCoreData(completion: @escaping(()->())) {
        self.downloadedTrailers = CoreDataHelper.shared.fetchDownloadedTrailers() ?? []
        completion()
    }
}

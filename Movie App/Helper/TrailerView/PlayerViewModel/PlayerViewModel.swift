//
//  PlayerViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 14.06.22.
//

import Foundation


class PlayerViewModel {
    
    var videos = [VideoResult]()
    
    init() {}
    
    func getMovieVideos(id: String, complete: @escaping()->()) {
        WebService.shared.getMovieVideos(id: id) { [unowned self] videos in
            self.videos = videos
            complete()
        }
    }
}

//
//  UIImageView + Extesion.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 03.06.22.
//

import UIKit

extension UIImageView {
    func loadImage(imageURL: String) {
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data )
                    }
                }
            }
        }
    }
}

// https://image.tmdb.org/t/p/w500
// https://image.tmdb.org/t/p/w185
//https://image.tmdb.org/t/p/w154/A6Y0m7qEe04ZTHKyYDLbnyCHNzn.jpg

//"backdrop_sizes": [
//      "w45",
//      "w92",
//      "w154",
//      "w185",
//      "w300",
//      "w500",
//      "w780",
//      "w1280",
//      "w1920",
//      "original"
//    ],
//    "logo_sizes": [
//      "w45",
//      "w92",
//      "w154",
//      "w185",
//      "w300",
//      "w500",
//      "original"
//    ],
//    "poster_sizes": [
//      "w45",
//      "w92",
//      "w154",
//      "w185",
//      "w300",
//      "w342",
//      "w500",
//      "w780",
//      "original"
//    ],
//    "profile_sizes": [
//      "w45",
//      "w92",
//      "w154",
//      "w185",
//      "h632",
//      "original"
//    ],
//    "still_sizes": [
//      "w45",
//      "w92",
//      "w154",
//      "w185",
//      "w300",
//      "original"
//    ]

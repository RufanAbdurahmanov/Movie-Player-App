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

//https://image.tmdb.org/t/p/w500

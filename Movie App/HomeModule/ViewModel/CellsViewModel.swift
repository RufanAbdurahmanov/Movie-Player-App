//
//  CellsViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 05.06.22.
//

import Foundation

struct CellsViewModel {
    
    var items = [MovieItem]()
    var title: String = ""
    
    init() { }
    
    init(title: String, items: [MovieItem]) {
        self.items = items
        self.title = title
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func itemAtCell(index: Int) -> MovieItem {
        return items[index]
    }
}

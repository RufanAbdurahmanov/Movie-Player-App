//
//  CellsViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 05.06.22.
//

import Foundation

struct CellsViewModel {
    
    var items = [CellItem]()
    var title: String = ""
    
    init() { }
    
    init(title: String, items: [CellItem]) {
        self.items = items
        self.title = title
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func itemAtCell(index: Int) -> CellItem {
        return items[index]
    }
}

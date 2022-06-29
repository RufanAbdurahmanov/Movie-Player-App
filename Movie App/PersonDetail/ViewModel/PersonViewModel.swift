//
//  PersonViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 13.06.22.
//

import Foundation

class PersonViewModel {
    
    var person: Person!
    var personID: Int!
    
    init() {}
    
    init(id: Int) {
        personID = id
    }
    
    func getPerson(complete: @escaping()->()) {
        WebService.shared.getPerson(id: personID) { [unowned self] person in
            self.person = person
            complete()
        }
    }
    
    
}

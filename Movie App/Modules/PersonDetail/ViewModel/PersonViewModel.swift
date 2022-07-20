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
    var personMovies = [Cast]()
    
    init() {}
    
    init(id: Int) {
        personID = id
    }
    
    func getPerson(complete: @escaping()->()) {
        WebService.shared.getPerson(id: personID) { [unowned self] person, error in
            if error == nil, person != nil {
                self.person = person
            }
            complete()
        }
    }
    func getPersonFilmography(complete: @escaping()->()) { 
        WebService.shared.getPersonFilmography(id: personID) { [unowned self] casts, error in
            if error == nil, casts != nil {
                self.personMovies = casts!
            }
            complete()
        }
    }
    
}

//
//  CharacterModel.swift
//  MarvelAPISwift
//
//  Created by Ramazan Ceylan on 16.01.2022.
//

import Foundation
import ObjectMapper

struct CharacterModel: Mappable {
    
    var id: Int?
    var name: String?
    var characterImagePath: String?
    var characterImageExt: String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        characterImagePath <- map["thumbnail.path"]
        characterImageExt <- map["thumbnail.extension"]
    }
}


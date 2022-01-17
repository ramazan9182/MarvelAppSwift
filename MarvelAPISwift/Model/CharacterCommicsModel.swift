//
//  CharacterCommicsModel.swift
//  MarvelAPISwift
//
//  Created by Ramazan Ceylan on 17.01.2022.
//

import Foundation
import ObjectMapper

struct CharacterCoomicsModel: Mappable {
    
    var title: String?
    var description: String?
    var commicsImagePath: String?
    var commicsImageExt: String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        commicsImagePath <- map["thumbnail.path"]
        commicsImageExt <- map["thumbnail.extension"]

    }
}




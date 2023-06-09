//
//  RickModel.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import Foundation
import ObjectMapper

class RickModel: Mappable {
    
    var allCharacter: [Characters] = []
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: Map) {
        allCharacter <- map["results"]
    }
}

class Characters: Mappable {
    
    var name: String = ""
    var image: String = ""
    var status: String = ""
    var species: String = ""
    var gender: String = ""
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        
        name <- map["name"]
        image <- map["image"]
        status <- map["status"]
        species <- map["species"]
        gender <- map["gender"]
    }
    
}

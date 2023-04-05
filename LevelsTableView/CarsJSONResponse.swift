//
//  CarsJSONResponse.swift
//  LevelsTableView
//
//  Created by soliduSystem on 03/04/23.
//

import Foundation

struct CarsJSONR : Codable {
    let nombre : String
    let marcas : [CarsJSONResponse]
}

struct CarsJSONResponse : Codable {
    let nombre : String
    let tipo : [CarsTypeJsonResponse]
}

struct CarsTypeJsonResponse : Codable {
    let nombre : String
    let modelo : [CarsModeloJSONResponse]
}

struct CarsModeloJSONResponse : Codable {
    let nombre : String
    let versiones : [CarsVersionJSONResponse]
}

struct CarsVersionJSONResponse : Codable {
    let nombre : String
    let año : [CarsYearJSONResponse]
}

struct CarsYearJSONResponse : Codable {
    let año : String
}

//
//  Product.swift
//  13_03_2023_NestedAPIWithJSONSerialization
//
//  Created by Vishal Jagtap on 12/05/23.
//

import Foundation

struct APIResponse {
    var products : [Product]
    var skip : Int
    var total : Int
    var limit : Int
}

struct Product {
    var id : Int
    var title : String
    var images : [String]
}

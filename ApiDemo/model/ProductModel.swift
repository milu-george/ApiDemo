//
//  ProductModel.swift
//  ApiDemo
//
//  Created by Milu Ann George on 27/11/23.
//

import Foundation

struct Welcome: Decodable {
    let products: [Product]
    let total, skip, limit: Int
}


struct Product: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

//Codable Protocol:
//Codable is a type alias for the combination of two other protocols: Encodable and Decodable.

//It allows you to work with data in both directions:
//Encoding: Converting your custom type instances (such as structs or classes) into another representation (e.g., JSON, plist).
//Decoding: Converting data from a representation (e.g., JSON) back into instances of your custom type.

//When a type conforms to Codable, it means it can be both encoded and decoded.
//It’s a powerful way to handle serialization and deserialization of data.

//Decodable Protocol:
//The process of converting data (e.g., JSON) into an instance of your custom type is known as decoding or deserialization.
//Custom types that need to be decoded from external data conform to the Decodable protocol.
//When you decode data, you’re creating instances of your custom type from a serialized format.

//
//  APIEndPoint.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import Foundation

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}

struct APIEndpoint {
    let path: String
    let method: HTTPMethod
    let headers: [String: String]
    let body: [String: Any]?
    
    var url: URL {
        return URL(string: "https://dummyjson.com\(path)")!
    }

    static func getProducts(limit: Int = 4, skip: Int = 0) -> APIEndpoint {
        return APIEndpoint(
            path: "/products?limit=\(limit)&skip=\(skip)",
            method: .GET,
            headers: ["Content-Type": "application/json"],
            body: nil
        )
    }

//    static func getProductDetails(id: Int) -> APIEndpoint {
//        return APIEndpoint(
//            path: "/products/\(id)",
//            method: .GET,
//            headers: ["Content-Type": "application/json"],
//            body: nil
//        )
//    }
}

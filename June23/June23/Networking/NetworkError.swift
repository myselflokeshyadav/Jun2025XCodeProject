//
//  NetworkError.swift
//  June23
//
//  Created by Lokesh Yadav on 24/06/25.
//


enum NetworkError: Error {
    case invalidURL
    case badResponse
    case decodablFailed(Error)
    case requestFailed(Error)
    
    var userMessge: String{
        switch self {
        case .invalidURL:                       return "Invalid URL"
        case .badResponse:                      return "unexpeted response from server"
        case .decodablFailed (let err):         return "Failed in decode data: \(err.localizedDescription)"
        case .requestFailed(let err):           return "Request Failed: \(err.localizedDescription)"
        }
    }
    
}

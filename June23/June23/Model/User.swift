//
//  User.swift
//  June23
//
//  Created by Lokesh Yadav on 24/06/25.
//
import Foundation

struct User:Codable {
    var id:Int
    var name : String?
    var address :Address?
}
struct Address:Codable {
    var city:String?
    var geo : Geo?
}
struct Geo:Codable {
    var lat:String?
    var lng: String?
}

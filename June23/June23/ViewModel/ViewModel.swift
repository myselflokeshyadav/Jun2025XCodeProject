//
//  ViewModel.swift
//  June23
//
//  Created by Lokesh Yadav on 24/06/25.
//
import Foundation

class ViewModelName {
   
    func loadDataArray() -> [User] {
        
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else { return [] }
        do {
            let data =  try Data(contentsOf: url)
            let arr = try JSONDecoder().decode([User].self, from: data)
            return arr
        } catch  {
            print("JSON not found")
            return []
        }
        
    }
}

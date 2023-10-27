//
//  ContentViewModel.swift
//  FortuneCookie
//
//  Created by Lily on 2023/10/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var items: [Item] = []
       
       struct Item: Identifiable, Decodable {
           var id: Int
           var text: String
       }

    // 테스트 데이터 불러옴
    func fetchData() {
         if let path = Bundle.main.path(forResource: "Sample", ofType: "json") {
             print(path)
             if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                 do {
                     let items = try JSONDecoder().decode([Item].self, from: data)
                     self.items = items
                 } catch {
                     print("Error decoding JSON: \(error)")
                 }
             }
         }
     }
    
    func randomItem() -> Item? {
        return items.randomElement()
    }
}

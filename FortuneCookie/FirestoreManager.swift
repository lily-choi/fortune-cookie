//
//  FirestoreManager.swift
//  FortuneCookie
//
//  Created by 최혜지 on 2023/10/27.
//

import Foundation
import Firebase

class FireStoreManager: ObservableObject {
    @Published var cookieTitle: String = ""

    func fetchData() {
        let db = Firestore.firestore()
        let docRef = db.collection("cookie").document("3kFqWCyWxKOlzW0thddD")
        
        print(docRef)
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                
                print(data)
                if let data = data {
                    print("data", data)
                    self.cookieTitle = data["title"] as? String ?? ""
                }
            }
        }
    }

    init() {
        fetchData()
    }
}

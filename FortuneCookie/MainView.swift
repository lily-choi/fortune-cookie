//
//  ContentView.swift
//  FortuneCookie
//
//  Created by 최혜지 on 2023/10/24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentsView()) {
                Text("오늘의 포춘쿠키")
              }
            .navigationTitle("포춘쿠키")
//            .navigationBarTitleDisplayMode(.inline)
          }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  ContentView.swift
//  FortuneCookie
//
//  Created by 최혜지 on 2023/10/24.
//

import SwiftUI

struct ContentsView: View {
    @StateObject var viewModel = ContentViewModel()
    @State var randomItem: ContentViewModel.Item?
    
    var body: some View {
        
//        Text("문제의 정답은 당신 마음속에 있습니다. 어떻게 하고 싶은지 생각해보세요.").font(.system(size: 12, weight: .light, design: .serif))
        VStack {
//            List(viewModel.items) {
//                item in
//                Text(item.text).font(.system(size: 12, weight: .light, design: .serif))
//            }
            if let item = randomItem {
                Text(item.text)
            }
        }
        .onAppear{
            viewModel.fetchData()
            randomItem = viewModel.randomItem()
        }
    }
}

struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}

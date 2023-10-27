//
//  ContentsView.swift
//  EveryDayQuote
//
//  Created by Lily on 2023/10/24.
//

import SwiftUI

struct ContentsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = ContentViewModel()
    @State var randomItem: ContentViewModel.Item?
    @State var appeared: Double = 0.0
    
    var body: some View {
        VStack {
            if randomItem == nil {
                Image("cookie")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 20)
                    .frame(width: 200, height: 200)
            }else{
                if let item = randomItem {
                    Text(item.text)
                        .font(.hanafont(.semibold, size: 28))
                        .frame(minHeight: 200)
                        .multilineTextAlignment(.center)
//                        .padding(EdgeInsets(top: 120, leading: 0, bottom: 20, trailing: 0))
                }
            }
        
            Button(action: {
                if randomItem != nil {
                    withAnimation{
                        randomItem = nil
                        appeared = 0.0
                    }
                }else{
                    withAnimation {
                        randomItem = viewModel.randomItem()
                        appeared = 1.0
                    }
                }
            }){
                Text(randomItem != nil ? "하나 더 열기" : "열어보기")
                    .font(.mainfont(.semibold, size: 16))
            }
            .buttonStyle(.bordered)
            .tint(.pink)
   
        }
        .onAppear{
            viewModel.fetchData()
        }
        .onDisappear {
            withAnimation{
                appeared = 0.0
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
//                        HStack {
//                            Text("포춘쿠키 ◡̎")
//                                .font(.mainfont(.semibold, size: 18))
//                                .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)))
//                        }
                        LogoView()
                    }
                )
    }
}

struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}

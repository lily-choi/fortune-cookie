//
//  MainView.swift
//  EveryDayQuote
//
//  Created by Lily on 2023/10/24.
//

import SwiftUI


struct MainView: View {
    @State var appeared: Double = 0.0

    @Namespace private var animationNamespace
    @State private var isLinkActive: Bool = false
    
    
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentsView()) {
                VStack{
                    Image("cookie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("오늘의 포춘쿠키")
                        .font(.mainfont(.semibold, size: 40))
                        .padding(.bottom, 4)
                        .opacity(appeared)
                        .animation(Animation.easeInOut(duration: 2.0), value: appeared)
                    Text("확인배보세요!")
                        .font(.mainfont(.semibold, size: 16))
                        .opacity(appeared)
                        .animation(Animation.easeInOut(duration: 2.0).delay(0.5), value: appeared)
                }
                .padding(.bottom, 60)
            }
            .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)))
            .navigationTitle("포춘쿠키 ◡̎").font(.mainfont(.semibold))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                   ToolbarItem(placement: .principal) {
                       LogoView()
                   }
             }
            .onAppear {self.appeared = 1.0}
            .onDisappear {self.appeared = 0.0}
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

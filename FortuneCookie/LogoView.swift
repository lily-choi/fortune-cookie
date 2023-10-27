//
//  LogoView.swift
//  EveryDayQuote
//
//  Created by Lily on 2023/10/26.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 2) {
            Text("포춘쿠키")
                .font(.mainfont(.semibold, size: 18))
                .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)))
            Image("smile")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}

//
//  ContentsView.swift
//  EveryDayQuote
//
//  Created by Lily on 2023/10/24.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSoundEffect() {
    guard let soundURL = Bundle.main.url(forResource: "crun", withExtension: "mp3") else {
        return
    }

    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

struct ContentsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = ContentViewModel()
    @State var randomItem: ContentViewModel.Item?
    @State var appeared: Double = 0.0
    
    @EnvironmentObject var firestoreManager: FireStoreManager
    
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
                }
            }
        
            Button(action: {
                if randomItem != nil {
                    withAnimation{
                        randomItem = nil
                        appeared = 0.0
                    }
                }else{
                    playSoundEffect()
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

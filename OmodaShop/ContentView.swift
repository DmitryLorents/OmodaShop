//
//  ContentView.swift
//  OmodaShop
//
//  Created by Dmitry on 02.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    private enum Constants {
        static let imageRatio = 345.0 / 198.0
        static let heightRation = 0.5
    }
    @State var pickerIndex = 0
    private var pickerLabel = ["C5", "S5", "S5 GT"]
    
    var body: some View {
        ZStack {
            
            Color.blackApp
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                    Image(.omodaLogo)
                        .padding()
                    Image(pickerLabel[pickerIndex], bundle: nil)
                        .resizable()
                        .aspectRatio(Constants.imageRatio, contentMode: .fit)
                        .padding(EdgeInsets(top: 22, leading: 22, bottom: 37, trailing: 22))
                    
                    Picker(selection: $pickerIndex) {
                        ForEach(0..<pickerLabel.count, id: \.self) {
                            Text(pickerLabel[$0]).tag($0)
                        }
                    } label: {
                        Text("")
                    }
                    .pickerStyle(.segmented)
                    .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .ignoresSafeArea()
                    .frame(height: UIScreen.main.bounds.height * Constants.heightRation)
                    .padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0))
                    
                

                
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

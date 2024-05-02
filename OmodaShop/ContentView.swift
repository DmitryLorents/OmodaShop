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
        static let infoTitle = "Информация об автомобиле"
        static let engine = "Двигатель"
        static let engineData = "1.6 Тurbo"
        static let drive = "Привод"
        static let driveValue = "AWD"
        static let options = "Комплектация"
        static let insurance = "ОМОДА Каско"
        static let price = "Цена"
        static let priceValue = 1_889_900
        static let currency = "руб"
        static let order = "Заказать"
        static let spacer = 14.0
        static let shareButtonWidth = 24.0
    }
    @State var pickerIndex = 0
    @State var sliderValue = 0.0
    @State var isInsuranceAplied = false
    private var pickerLabel = ["C5", "S5", "S5 GT"]
    private var options = ["Joy", "LifeStyle", "Ultimate", "Active", "Supreme"]
    
    var body: some View {
        ZStack {
            
            Color.blackApp
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                        .frame(width: Constants.shareButtonWidth)
                    Spacer()
                    Image(.omodaLogo)
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(.share)
                            .frame(width: Constants.shareButtonWidth)
                    })
                }.padding(.horizontal)
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
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.white))
                    .padding(EdgeInsets(top: 0, leading: 22, bottom: 22, trailing: 22))
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .ignoresSafeArea()
                    .frame(height: UIScreen.main.bounds.height * Constants.heightRation)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .overlay(
                        VStack {
                            
                            Text(Constants.infoTitle)
                                .font(.system(size: 18, weight: .bold))
                                .padding(EdgeInsets(top: 25, leading: 0, bottom: 20, trailing: 0))
                            
                            HStack {
                                Text(Constants.engine)
                                    .font(.system(size: 16))
                                Spacer()
                                Text(Constants.engineData)
                            }.padding(.horizontal)
                            Divider()
                                .padding(EdgeInsets(top: 0, leading: 70, bottom: 16, trailing: 70))
                            
                            HStack {
                                Text(Constants.drive)
                                    .font(.system(size: 16))
                                Spacer()
                                Text(Constants.driveValue)
                            }.padding(.horizontal)
                            Divider()
                                .padding(EdgeInsets(top: 0, leading: 70, bottom: 16, trailing: 70))
                            HStack {
                                Text(Constants.options)
                                    .padding(.horizontal)
                                    Spacer()
                            }
                            
                            Slider(value: $sliderValue, in: 0...760, step: 190, label: {})
                                .padding(.horizontal)
                                .tint(.black)
                            
                            HStack {
                                Spacer()
                                ForEach(0..<options.count, id: \.self) {
                                    Text(options[$0])
                                        Spacer()

                                }
                            }
                            .padding(.bottom)
                            
                            Toggle(isOn: $isInsuranceAplied) {
                                Text(Constants.insurance)
                                    .font(.system(size: 16))
                                    
                            }
                            .padding(.horizontal)
                            
                            Divider().padding(EdgeInsets(top: 0, leading: 70, bottom: 16, trailing: 70))
                            
                            HStack {
                                Text(Constants.price)
                                Spacer()
                                Text("\(Constants.priceValue) \(Constants.currency)")
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                            .font(.system(size: 18, weight: .bold))
                            
                            Button(action: {}) {
                                Spacer()
                                Text(Constants.order)
                                Spacer()
                            }
                            .foregroundColor(.white)
                            .frame(height: 48)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.blackApp))
                            .padding(.horizontal)
                            
                        }
                    )
                

                
                
            }
            
        }
        
    }
    
    
}

#Preview {
    ContentView()
}

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
        static let currency = "руб"
        static let order = "Заказать"
        static let spacer = 14.0
        static let shareButtonWidth = 24.0
        static let orderMessage = "Благодарим за заказ. Наш менеджер свяжется с Вами в рабочее время для уточнения деталей."
    }
    
    @ObservedObject private var viewModel = OmodaViewModel(model: CarData())
    @State var pickerIndex = 0
    @State var sliderValue = 0.0
    @State var isOrderButtonPressed = false
    
    var pickerMaxValue: Double {
        viewModel.optionCost * Double(viewModel.options.count - 1)
    }
    var step: Double {
        viewModel.optionCost
    }
    
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
                Image(viewModel.models[pickerIndex], bundle: nil)
                        .resizable()
                        .aspectRatio(Constants.imageRatio, contentMode: .fit)
                        .padding(EdgeInsets(top: 22, leading: 22, bottom: 37, trailing: 22))
                    
                    Picker(selection: $pickerIndex) {
                        ForEach(0..<viewModel.models.count, id: \.self) {
                            Text(viewModel.models[$0]).tag($0)
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
                            
                            
                            
                            Slider(value: Binding(get: {
                                sliderValue
                            }, set: { newValue in
                                    sliderValue = newValue
                                viewModel.updatePrice(value: newValue)
                                print(viewModel.actualPrice)
                            }), in: 0...pickerMaxValue, step: step, label: {})
                                .padding(.horizontal)
                                .tint(.black)
                            
                            HStack {
                                Spacer()
                                ForEach(0..<viewModel.options.count, id: \.self) {
                                    Text(viewModel.options[$0])
                                        Spacer()

                                }
                            }
                            .padding(.bottom)
                            
                            
                            Toggle(isOn: Binding(get: {
                                viewModel.isInsuranceAplied
                            }, set: { newValue in
                                viewModel.isInsuranceAplied = newValue
                                viewModel.updatePrice(value: sliderValue)
                            }), label: {
                                Text(Constants.insurance)
                                    .font(.system(size: 16))
                                    
                            })
                            .padding(.horizontal)
                            
                            Divider().padding(EdgeInsets(top: 0, leading: 70, bottom: 16, trailing: 70))
                            
                            HStack {
                                Text(Constants.price)
                                Spacer()
                                Text("\(Int(viewModel.actualPrice)) \(Constants.currency)")
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                            .font(.system(size: 18, weight: .bold))
                            
                            Button(action: {
                                isOrderButtonPressed = true
                            }) {
                                Spacer()
                                Text(Constants.order)
                                Spacer()
                            }
                            .foregroundColor(.white)
                            .frame(height: 48)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.blackApp))
                            .padding(.horizontal)
                            .actionSheet(isPresented: $isOrderButtonPressed, content: {
                                ActionSheet(title: Text(Constants.orderMessage))
                            })
                            
                        }
                    )
                

                
                
            }
            
        }
        
    }
    
    
}

#Preview {
    ContentView()
}

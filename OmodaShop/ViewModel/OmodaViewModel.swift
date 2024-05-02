//
//  OmodaViewModel.swift
//  OmodaShop
//
//  Created by Dmitry on 02.05.2024.
//

import Foundation

final class OmodaViewModel: ObservableObject {
    @Published public var optionCost: Double
    @Published public var actualPrice: Double
    @Published public var isInsuranceAplied = false
    public let options: [String]
    public let models: [String]
    
    private var model: CarData
    
    init(model: CarData) {
        self.model = model
        optionCost = model.optionCost
        actualPrice = model.minimalPrice
        options = model.options
        models = model.models
    }
    
    func updatePrice(value: Double) {
        actualPrice = model.minimalPrice + value
        if isInsuranceAplied {
            actualPrice += model.insuranceCost
        }
    }
    
    func addInsurance(_ isAdded: Bool) {
        
    }
}


struct CarData {
    let optionCost = 190.0
    let insuranceCost = 99_000.0
//    private var actualPrice: Double
    let minimalPrice = 1_889_900.0
    
    let options = ["Joy", "LifeStyle", "Ultimate", "Active", "Supreme"]
    let models = ["C5", "S5", "S5 GT"]
    
//    func getPrice() -> Double {
//        actualPrice
//    }
//    
//    mutating func setPrice(value: Double) {
//        actualPrice = minimalPrice + value
//    }
}

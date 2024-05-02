//
//  OmodaViewModel.swift
//  OmodaShop
//
//  Created by Dmitry on 02.05.2024.
//

import Foundation

final class OmodaViewModel: ObservableObject {
    
    @Published public var actualPrice: Double
    @Published public var isInsuranceAplied = false
    public var optionCost: Double
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




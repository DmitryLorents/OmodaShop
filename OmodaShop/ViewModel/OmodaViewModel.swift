//
//  OmodaViewModel.swift
//  OmodaShop
//
//  Created by Dmitry on 02.05.2024.
//

import Foundation

final class OmodaViewModel: ObservableObject {

    
    @Published public var optionSliderValue = 0.0 {
        didSet {
            updatePrice()
        }
    }
    @Published public var actualPrice: Double
    @Published public var isInsuranceAplied = false {
        didSet {
            updatePrice()
        }
    }
    @Published public var modelIndex: Int {
        didSet {
            updatePrice()
        }
    }
    public var optionCost: Double
    public let options: [String]
    public let models: [String]
    
    private var model: CarData
    
    init(model: CarData) {
        self.model = model
        optionCost = model.optionCost
        actualPrice = model.modelPrices[model.modelIndex]
        options = model.options
        models = model.models
        modelIndex = model.modelIndex
    }
    
    func updatePrice() {
        actualPrice = model.modelPrices[modelIndex] + optionSliderValue
        if isInsuranceAplied {
            actualPrice += model.insuranceCost
        }
    }
}




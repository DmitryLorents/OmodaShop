//
//  CarInfoActivity.swift
//  OmodaShop
//
//  Created by Dmitry on 03.05.2024.
//

import UIKit

final class CarInfoActivity: UIActivity {
    // MARK: - Properties
    
    var carActivityType: UIActivity.ActivityType
    var activityName: String
    var activityImageName: String
    var onTapAction: () -> Void
    
    // MARK: - Initializer
    
    init(activityName: String, activityImageName: String, onTapAction: @escaping () -> Void) {
        self.carActivityType = UIActivity.ActivityType("Action \(activityName)")
        self.activityName = activityName
        self.activityImageName = activityImageName
        self.onTapAction = onTapAction
    }
    
    // MARK: - Override
    override var activityType: UIActivity.ActivityType? {
        carActivityType
    }
    
    override class var activityCategory: UIActivity.Category {
        .share
    }
    
    override var activityImage: UIImage? {
        UIImage(named: activityImageName)?.withRenderingMode(.alwaysOriginal)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        // Nothing to prepare
    }
    
    override func perform() {
        onTapAction()
    }
    
}

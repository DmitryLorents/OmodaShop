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
    
    init(title: String, activityImageName: String, onTapAction: @escaping () -> Void) {
        self.carActivityType = UIActivity.ActivityType(rawValue: "Action \(title)")
        activityName = title
        self.activityImageName = activityImageName
        self.onTapAction = onTapAction
        super.init()
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

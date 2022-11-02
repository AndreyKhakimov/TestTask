//
//  UIBarButtonItem.swift
//  TestTask
//
//  Created by Andrey Khakimov on 01.11.2022.
//

import UIKit

extension UIBarButtonItem {
    
    static func createCustomButton(vc: UIViewController, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "chevron")?.withRenderingMode(.alwaysTemplate),
                        for: .normal)
//        button.contentVerticalAlignment = .fill
//        button.contentHorizontalAlignment = .fill
//        button.imageView?.contentMode = .scaleAspectFit
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -100)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.addTarget(vc, action: selector, for: .touchUpInside)
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.imagePadding = 7
            configuration.contentInsets = .init(top: 0, leading: -7, bottom: 0, trailing: 0)
            button.configuration = configuration
        } else {
            button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: -10)
        }
        
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
    
}

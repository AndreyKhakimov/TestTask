//
//  UIViewController+Alert.swift
//  TestTask
//
//  Created by Andrey Khakimov on 01.11.2022.
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func presentChangeAlert(completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "Data has been changed",
                                                message: "Do you want to save changes?",
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            completionHandler(true)
        }
        
        let skipAction = UIAlertAction(title: "Skip", style: .default) { _ in
            completionHandler(false)
        }
        alertController.addAction(saveAction)
        alertController.addAction(skipAction)
        present(alertController, animated: true)
    }
    
}

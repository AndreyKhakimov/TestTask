//
//  ViewController.swift
//  TestTask
//
//  Created by Andrey Khakimov on 31.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainTableView = MainTableView()
    
    private var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        getUserModel()
        setValueArray()
    }
    
    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Редактировать",
            style: .plain,
            target: self,
            action: #selector(editingTapped)
        )
        view.addView(mainTableView)
    }

    @objc private func editingTapped() {
        let editingVC = EditingViewController(userModel)
        navigationController?.pushViewController(editingVC, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
    }
    
    private func saveEditModel(_ model: UserModel) {
        UserDefaultsHelper.saveUserValue(Resources.NameFields.firstName.rawValue, model.firstName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.secondName.rawValue, model.secondName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.thirdName.rawValue, model.thirdName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.dateOfBirth.rawValue, model.dateOfBirth)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.gender.rawValue, model.gender)
    }
    
    private func getValueArray() -> [String] {
        var valueArray = [String]()
        for key in Resources.NameFields.allCases {
            let value = UserDefaultsHelper.getUserValue(key.rawValue)
            valueArray.append(value)
        }
        
        return valueArray
    }
    
    private func setValueArray() {
        let valueArray = getValueArray()
        mainTableView.setValueArray(valueArray)
        mainTableView.reloadData()
    }
    
    public func changeUserModel(model: UserModel) {
        saveEditModel(model)
        
        userModel = model
        setValueArray()
//        mainTableView.reloadData()
    }

}

// MARK: - setConstraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
}

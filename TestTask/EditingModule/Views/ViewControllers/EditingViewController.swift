//
//  EditingViewController.swift
//  TestTask
//
//  Created by Andrey Khakimov on 31.10.2022.
//

import UIKit

final class EditingViewController: UIViewController {
    
    private let editingTableView = EditingTableView()
    private var userModel: UserModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        print(userModel)
    }
    
    init(_ userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить",
            style: .plain,
            target: self,
            action: #selector(saveTapped)
        )
        
        let backBarButtonItem = UIBarButtonItem.createCustomButton(vc: self, selector: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backBarButtonItem
        editingTableView.setUserModel(userModel)
        view.addView(editingTableView)
    }

    @objc private func saveTapped() {
        let editUserModel = editingTableView.getUserModel()
        
        if authFields(model: editUserModel) {
            presentSimpleAlert(title: "Успешно", message: "Success")
        } else {
            presentSimpleAlert(title: "Ошибка", message: "Заполните поля ФИО")
        }
        
    }
    
    @objc private func backButtonTapped() {
        let editUserModel = editingTableView.getUserModel()
        print(userModel)
        print(editUserModel)
        if editUserModel == userModel {
            navigationController?.popViewController(animated: true)
        } else {
            presentChangeAlert { [weak self] value in
                if value {
                    guard let firstVC = self?.navigationController?.viewControllers.first as? MainViewController else { return }
                    firstVC.changeUserModel(model: editUserModel)
                    self?.navigationController?.popViewController(animated: true)
                } else {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    private func authFields(model: UserModel) -> Bool {
        if model.firstName == "" ||
            model.secondName == "" ||
            model.dateOfBirth == "" ||
            model.gender == "" {
            return false
        }
        
        return true
    }
    
}

// MARK: - setConstraints

extension EditingViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            editingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

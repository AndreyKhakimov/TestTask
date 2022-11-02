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
        view.addView(editingTableView)
    }

    @objc private func saveTapped() {
        if authFields() {
            presentSimpleAlert(title: "Saving was successful", message: "Success")
        } else {
            presentSimpleAlert(title: "Saving error", message: "Enter all required data")
        }
    }
    
    @objc private func backButtonTapped() {
        presentChangeAlert { value in
            if value {
                // TODO: send model
                self.navigationController?.popViewController(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func authFields() -> Bool {
        if userModel.firstName != "" ||
            userModel.secondName != "" ||
            userModel.dateOfBirth != "" ||
            userModel.gender != "" {
            return true
        }
        
        return false
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

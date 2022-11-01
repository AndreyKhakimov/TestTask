//
//  EditingViewController.swift
//  TestTask
//
//  Created by Andrey Khakimov on 31.10.2022.
//

import UIKit

final class EditingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        tableView.register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.identifier)
        tableView.register(DatePickerTableViewCell.self, forCellReuseIdentifier: DatePickerTableViewCell.identifier)
        tableView.register(PickerViewTableViewCell.self, forCellReuseIdentifier: PickerViewTableViewCell.identifier)
    }
    
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить",
            style: .plain,
            target: self,
            action: #selector(editingTapped)
        )
    }

    @objc private func editingTapped() {
        print("Tapped test")
    }

}

extension EditingViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nameField = Resources.NameFields.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.identifier,
                                                           for: indexPath) as? TextViewTableViewCell else {
                return UITableViewCell()
            }
            cell.nameTextViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: nameField, scrollEnable: false)
            } else {
                cell.configure(name: nameField, scrollEnable: true)
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.identifier,
                                                           for: indexPath) as? DatePickerTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: nameField)
            
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickerViewTableViewCell.identifier,
                                                           for: indexPath) as? PickerViewTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: nameField)
            
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
}

extension EditingViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

// MARK: - NameTextViewProtocol

extension EditingViewController: NameTextViewProtocol {
    
    func changeSize() {
        tableView.beginUpdates()
        
        tableView.endUpdates()
    }
    
}

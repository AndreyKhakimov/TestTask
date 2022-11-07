//
//  MainTableView.swift
//  TestTask
//
//  Created by Andrey Khakimov on 06.11.2022.
//

import UIKit

class MainTableView: UITableView {
    
    private var valueArray = [String]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        delegate = self
        dataSource = self
        
        register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,
                                                       for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let nameField = Resources.NameFields.allCases[indexPath.row].rawValue
        let value = valueArray[indexPath.row]
        cell.configure(name: nameField, value: value)
        return cell
    }
    
    public func setValueArray(_ array: [String]) {
        valueArray = array
    }
}

extension MainTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

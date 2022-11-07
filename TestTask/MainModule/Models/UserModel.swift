//
//  UserModel.swift
//  TestTask
//
//  Created by Andrey Khakimov on 01.11.2022.
//

import Foundation

struct UserModel {
    
    var firstName = ""
    var secondName = ""
    var thirdName = ""
    var dateOfBirth = ""
    var gender = ""
    
    static func == (_ firstModel: UserModel, _ secondModel: UserModel) -> Bool {
        firstModel.firstName == secondModel.firstName &&
        firstModel.secondName == secondModel.secondName &&
        firstModel.thirdName == secondModel.thirdName &&
        firstModel.dateOfBirth == secondModel.dateOfBirth &&
        firstModel.gender == secondModel.gender
    }
    
}

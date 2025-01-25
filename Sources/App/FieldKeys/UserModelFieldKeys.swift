//
//  UserModelFieldKeys.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 25/01/25.
//

import Foundation
import Fluent

extension UserModel {
    struct FieldKeys {
        static var name: FieldKey {"name"}
        static var lastname: FieldKey {"lastname"}
        static var username: FieldKey {"username"}
        static var email: FieldKey {"email"}
        static var password: FieldKey {"password"}
        static var city: FieldKey {"city"}
        static var postalcode: FieldKey {"postalcode"}
        static var address: FieldKey {"address"}
        static var country: FieldKey {"country"}
        static var role: FieldKey {"role"}
        static var subscriptionAtiveTill: FieldKey {"subscriptionAtiveTill"}
        static var myCourses: FieldKey {"myCourses"}
        static var bio: FieldKey {"bio"}
        static var completedCourses: FieldKey {"completedCourses"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var userImage: FieldKey {"userImage"}
    }
}

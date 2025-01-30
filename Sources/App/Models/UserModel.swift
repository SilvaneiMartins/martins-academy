//
//  File.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 25/01/25.
//

import Foundation
import Vapor
import Fluent

final class UserModel: Model {
    static var schema: String = SchemaEnum.users.rawValue
    
    @ID
    var id: UUID?
    
    @OptionalField(key: FieldKeys.name)
    var name: String?
    
    @OptionalField(key: FieldKeys.lastname)
    var lastname: String?
    
    @OptionalField(key: FieldKeys.username)
    var username: String?
    
    @OptionalField(key: FieldKeys.email)
    var email: String?
    
    @OptionalField(key: FieldKeys.password)
    var password: String?
    
    @OptionalField(key: FieldKeys.city)
    var city: String?
    
    @OptionalField(key: FieldKeys.postalcode)
    var postalcode: String?
    
    @OptionalField(key: FieldKeys.address)
    var address: String?
    
    @OptionalField(key: FieldKeys.country)
    var country: String?
    
    @Field(key: FieldKeys.role)
    var role: RoleEnum.RawValue
    
    @OptionalField(key: FieldKeys.subscriptionAtiveTill)
    var subscriptionAtiveTill: Date?
    
    @OptionalField(key: FieldKeys.myCourses)
    var myCourses: [UUID]?
    
    @OptionalField(key: FieldKeys.bio)
    var bio: String?
    
    @OptionalField(key: FieldKeys.completedCourses)
    var completedCourses: [UUID]?
    
    @Timestamp(key: FieldKeys.createdAt, on: .create)
    var createdAt: Date?
    
    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    var updatedAt: Date?
    
    @OptionalField(key: FieldKeys.userImage)
    var userImage: URL?
    
    init() {}
    
    init(username: String?, email: String, password: String, role: RoleEnum.RawValue, createdAt: Date?, updatedAt: Date?) {
        self.username = username
        self.email = email
        self.password = password
        self.role = role
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    init(name: String?, lastname: String?, username: String?, email: String?, password: String?, city: String?, portalcode: String?, address: String?, country: String?, bio: String?, createdAt: Date?, updatedAt: Date?) {
        self.name = name
        self.lastname = lastname
        self.username = username
        self.email = email
        self.password = password
        self.city = city
        self.postalcode = portalcode
        self.country = country
        self.bio = bio
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    init(subscriptionAtiveTill: Date?) {
        self.subscriptionAtiveTill = subscriptionAtiveTill
    }
    
    init(myCourses: [UUID]?) {
        self.myCourses = myCourses
    }
    
    init(completedCourses: [UUID]?) {
        self.completedCourses = completedCourses
    }
    
    init(userImage: URL?) {
        self.userImage = userImage
    }
    
    init(role: RoleEnum.RawValue) {
        self.role = role
    }
    
    final class Public: Content {
        var id: UUID?
        var username: String?
        var email: String?
        var name: String?
        var lastname: String?
        var updatedAt: Date?
        var city: String?
        var subscriptionAtiveTill: Date?
        var myCourses: [UUID]?
        var completedCount: [UUID]?
        var bio: String?
        
        init(id: UUID? = nil, username: String?, email: String?, name: String?, lastname: String?, updatedAt: Date?, city: String?, subscriptionAtiveTill: Date?, myCourses: [UUID]?, completedCount: [UUID]?, bio: String?) {
            self.id = id
            self.username = username
            self.email = email
            self.name = name
            self.lastname = lastname
            self.updatedAt = updatedAt
            self.city = city
            self.subscriptionAtiveTill = subscriptionAtiveTill
            self.myCourses = myCourses
            self.completedCount = completedCount
            self.bio = bio
        }
    }
}

extension UserModel: Content {}

extension UserModel {
    func convertToPublic() -> UserModel.Public {
        return UserModel.Public(username: username, email: email, name: name, lastname: lastname, updatedAt: updatedAt, city: city, subscriptionAtiveTill: subscriptionAtiveTill, myCourses: myCourses, completedCount: completedCourses, bio: bio)
    }
}

extension Collection where Element: UserModel {
    func convertToPublic() -> [UserModel.Public] {
        return self.map {
            $0.convertToPublic()
        }
    }
}

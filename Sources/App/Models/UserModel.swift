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
}

extension UserModel: Content {}

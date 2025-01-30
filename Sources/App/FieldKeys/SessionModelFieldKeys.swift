//
//  SessionModelFieldKeys.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 29/01/25.
//

import Foundation
import Vapor
import Fluent

extension SessionModel {
    struct FieldKeys {
        static var title: FieldKey {"title"}
        static var mp4Url: FieldKey {"mp4URL"}
        static var h1sURL: FieldKey {"h1sURL"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var publishDate: FieldKey {"publishDate"}
        static var status: FieldKey {"status"}
        static var price: FieldKey {"price"}
        static var article: FieldKey {"article"}
        static var course: FieldKey {"course"}
        static var slug: FieldKey {"slug"}
    }
}

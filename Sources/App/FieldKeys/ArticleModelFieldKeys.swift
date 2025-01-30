//
//  ArticleModelFieldKeys.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 29/01/25.
//

import Foundation
import Fluent
import Vapor

extension ArticleModel {
    struct FieldKeys {
        static var title: FieldKey {"title"}
        static var slug: FieldKey {"slug"}
        static var excerp: FieldKey {"excerp"}
        static var content: FieldKey {"content"}
        static var guide: FieldKey {"guide"}
        static var headerImage: FieldKey {"headerImage"}
        static var author: FieldKey {"author"}
        static var status: FieldKey {"status"}
        static var price: FieldKey {"price"}
        static var role: FieldKey {"role"}
        static var createdAt: FieldKey {"createdAt"}
        static var updatedAt: FieldKey {"updatedAt"}
        static var publishAt: FieldKey {"publishAt"}
        static var tags: FieldKey {"tags"}
    }	
}

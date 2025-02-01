//
//  TokenModelFieldKeys.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 01/02/25.
//

import Foundation
import Fluent
import Vapor

extension TokenModel {
    struct FieldKeys {
        static var value: FieldKey {"value"}
        static var userId: FieldKey {"userID"}
    }
}

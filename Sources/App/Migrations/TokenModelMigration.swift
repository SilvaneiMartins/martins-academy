//
//  TokenModelMigration.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 01/02/25.
//

import Foundation
import Fluent
import Vapor

struct TokenModelMigration: AsyncMigration {
    let keys = TokenModel.FieldKeys.self
    let schema = TokenModel.schema.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.value, .string)
            .field(keys.userId, .uuid)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema(schema).delete()
    }
}

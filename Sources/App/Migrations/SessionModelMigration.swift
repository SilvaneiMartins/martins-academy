//
//  SessionModelMigration.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 29/01/25.
//

import Foundation
import Fluent
import Vapor

struct SessionModelMigratino: AsyncMigration {
    let schema = SessionModel.schema.self
    let keys = SessionModel.FieldKeys.self
    
    func prepare(on database: Database) async throws {
        try await database.schema(schema)
            .id()
            .field(keys.title, .string)
            .field(keys.mp4Url, .string)
            .field(keys.createdAt, .datetime)
            .field(keys.updatedAt, .datetime)
            .field(keys.publishDate, .datetime)
            .field(keys.status, .string)
            .field(keys.price, .string)
            .field(keys.course, .string)
            .field(keys.slug, .string)
            .unique(on: keys.mp4Url)
            .unique(on: keys.h1sURL)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(schema).delete()
    }
}

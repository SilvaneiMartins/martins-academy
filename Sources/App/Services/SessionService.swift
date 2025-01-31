//
//  SessionService.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 31/01/25.
//

import Foundation
import Vapor
import Fluent

struct SessionService: ContentProtocol {
    typealias answer = SessionModel
    typealias model = SessionModel
    typealias request = Request
    typealias status = HTTPStatus
    typealias createDTO = CreateSessionDTO
    typealias updateDTO = UpdateSessionDTO
    
    static func create(_ req: Vapor.Request, createDTO: CreateSessionDTO, author: UserModel) async throws -> Vapor.HTTPStatus {
        guard let course = try await CourseModel.find(createDTO.course, on: req.db) else {
            throw Abort(.notFound, reason: "Curso com o ID \(String(describing: createDTO.course)) não encontrado.")
        }
        
        let slug = createDTO.title?.replacingOccurrences(of: " ", with: "-")
        
        let session = SessionModel(title: createDTO.title,
                                   mp4URL: createDTO.mp4URL,
                                   h1sURL: createDTO.h1sURL,
                                   createdAt: Date(),
                                   updatedAt: Date(),
                                   publishDate: createDTO.publishDate,
                                   price: createDTO.price ?? course.price,
                                   article: createDTO.article,
                                   course: createDTO.course!,
                                   slug: slug)
        
        try await session.save(on: req.db)
        
        return .ok
    }
    
    static func get(_ req: Vapor.Request, object: String) async throws -> SessionModel {
        guard let session = try await SessionModel.query(on: req.db)
            .filter(\.$slug == object)
            .first() else {
            throw Abort(.notFound, reason: "Sessão não encontrada.")
        }
        
        return session
    }
    
    static func getAll(_ req: Vapor.Request) async throws -> [SessionModel] {
        return try await SessionModel.query(on: req.application.db)
            .all()
    }
    
    static func update(_ req: Vapor.Request, object: String, updateDTO: UpdateSessionDTO) async throws -> SessionModel {
        let uuid = try await getIDFromSlug(req, slug: object)
        guard let session = try await SessionModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Sessão não encontrada.")
        }
        
        session.title = updateDTO.title ?? session.title
        session.mp4Url = updateDTO.mp4URL ?? session.mp4Url
        session.h1sURL = updateDTO.h1sURL ?? session.h1sURL
        session.publishDate = updateDTO.publishDate ?? session.publishDate
        session.status = updateDTO.status ?? session.status
        session.price = updateDTO.price ?? session.price
        session.article = updateDTO.article ?? session.article
        session.course = updateDTO.course ?? session.course
        session.updatedAt = Date()
        
        try await session.save(on: req.db)
        return session
    }
    
    static func delete(_ req: Vapor.Request, object: String) async throws -> Vapor.HTTPStatus {
        let uuid = try await getIDFromSlug(req, slug: object)
        guard let session = try await SessionModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Curso com o ID \(uuid) não encontrado.")
        }
        try await session.delete(on: req.db)
        return .ok
    }
}

extension SessionService: TransformProtocol {
    typealias answerWithID = UUID
    
    static func getIDFromSlug(_ req: Request, slug: String) async throws -> UUID {
        guard let session = try await SessionModel.query(on: req.db)
            .filter(\.$slug == slug)
            .first() else {
            throw Abort(.notFound, reason: "Sessão não encontrada.")
        }
        
        return session.id!
    }
}

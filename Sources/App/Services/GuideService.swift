//
//  GuideService.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 31/01/25.
//

import Foundation
import Fluent
import Vapor

struct GuideService: ContentProtocol {
    typealias answer = GuideModel
    typealias model = GuideModel
    typealias request = Request
    typealias status = HTTPStatus
    typealias createDTO = CreateGuideDTO
    typealias updateDTO = UpdateGuideDTO
    
    static func create(_ req: Vapor.Request, createDTO: CreateGuideDTO, author: UserModel) async throws -> Vapor.HTTPStatus {
        let slug = createDTO.title?.replacingOccurrences(of: " ", with: "-")
        
        let guide = GuideModel(title: createDTO.title,
                               description: createDTO.description,
                               headerImage: createDTO.headerImage,
                               price: createDTO.price,
                               status: createDTO.status ?? StatusEnum.draft.rawValue,
                               slug: slug,
                               tags: createDTO.tags,
                               publishDate: createDTO.publishDate,
                               createdAt: Date(),
                               updatedAt: Date())
        
        try await guide.save(on: req.db)
        return .ok
    }
    
    static func get(_ req: Vapor.Request, object: String) async throws -> GuideModel {
        guard let guide = try await GuideModel.query(on: req.db)
            .filter(\.$slug == object)
            .first() else {
            throw Abort(.notFound, reason: "O guia não pôde ser encontrado.")
        }
        
        return guide
    }
    
    static func getAll(_ req: Vapor.Request) async throws -> [GuideModel] {
        return try await GuideModel.query(on: req.db)
            .all()
    }
    
    static func update(_ req: Vapor.Request, object: String, updateDTO: UpdateGuideDTO) async throws -> GuideModel {
        let uuid = try await getIDFromSlug(req, slug: object)
        
        guard let guide = try await GuideModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Guia coim o ID \(uuid) não encontrado.")
        }
        
        guide.title = updateDTO.title ?? guide.title
        guide.description = updateDTO.description ?? guide.description
        guide.headerImage = updateDTO.headerImage ?? guide.headerImage
        guide.price = updateDTO.price ?? guide.price
        guide.status = updateDTO.status ?? guide.status
        guide.tags = updateDTO.tags ?? guide.tags
        guide.publishDate = updateDTO.publishDate ?? guide.publishDate
        
        try await guide.save(on: req.db)
        return guide
    }
    
    static func delete(_ req: Vapor.Request, object: String) async throws -> Vapor.HTTPStatus {
        let uuid = try await getIDFromSlug(req, slug: object)
        
        guard let guide = try await GuideModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Guia coim o ID \(uuid) não encontrado.")
        }
        
        try await guide.delete(on: req.db)
        return .ok
    }
}

extension GuideService: TransformProtocol {
    static func getIDFromSlug(_ req: Vapor.Request, slug: String) async throws -> UUID {
        guard let guide = try await CourseModel.query(on: req.db)
            .filter(\.$slug == slug)
            .first() else {
            throw Abort(.notFound, reason: "Sessão não encontrada.")
        }
        
        return guide.id!
    }
    
    typealias answerWithID = UUID
}

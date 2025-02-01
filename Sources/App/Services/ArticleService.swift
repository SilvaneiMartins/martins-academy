//
//  ArticleService.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 31/01/25.
//

import Foundation
import Fluent
import Vapor

struct ArticleService: ContentProtocol {
    typealias answer = ArticleModel
    typealias model = ArticleModel
    typealias request = Request
    typealias status = HTTPStatus
    typealias createDTO = CreateArticleDTO
    typealias updateDTO = UpdateArticleDTO
    
    
    static func create(_ req: Vapor.Request, createDTO: CreateArticleDTO, author: UserModel) async throws -> Vapor.HTTPStatus {
        let slug = createDTO.title?.replacingOccurrences(of: " ", with: "-")
        
        guard let guide = try await GuideModel.find(createDTO.guide, on: req.db) else {
            throw Abort(.notFound, reason: "Não foi possível encontrar o guia com o ID de \(String(describing: createDTO.guide))")
        }
        
        let article = ArticleModel(title: createDTO.title,
                                   slug: slug,
                                   excerp: createDTO.excerp,
                                   content: createDTO.content,
                                   guide: createDTO.guide!,
                                   headerImage: createDTO.headerImage,
                                   author: "",
                                   status: createDTO.status ?? StatusEnum.draft.rawValue,
                                   price: (createDTO.price ?? guide.price)!,
                                   role: createDTO.role,
                                   createdAt: Date(),
                                   updatedAt: Date(),
                                   publishDate: createDTO.puclishDate,
                                   tags: createDTO.tags)
        
        try await article.save(on: req.db)
        return .ok
    }
    
    static func get(_ req: Vapor.Request, object: String) async throws -> ArticleModel {
        guard let article = try await ArticleModel.query(on: req.db)
            .filter(\.$slug == object)
            .first() else {
            throw Abort(.notFound, reason: "Não foi possível encontrar o artigo.")
        }
        
        return article
    }
    
    static func getAll(_ req: Vapor.Request) async throws -> [ArticleModel] {
        return try await ArticleModel.query(on: req.db)
            .all()
    }
    
    static func update(_ req: Vapor.Request, object: String, updateDTO: UpdateArticleDTO) async throws -> ArticleModel {
        let uuid = try await getIDFromSlug(req, slug: object)
        
        guard let article = try await ArticleModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Não foi possível encontrar o artigo com ID \(uuid)")
        }
        
        guard let guide = try await GuideModel.find(updateDTO.guide ?? article.guide, on: req.db) else {
            throw Abort(.notFound, reason: "Guia com 0 ID \(String(describing: updateDTO.guide)) não foi encontrado .")
        }
        
        let slug = updateDTO.title?.replacingOccurrences(of: " ", with: "-")
        
        article.title = updateDTO.title ?? article.title
        article.excerp = updateDTO.excerp ?? article.excerp
        article.slug = slug ?? article.slug
        article.content = updateDTO.content ?? article.content
        article.guide = guide.id
        article.price = guide.price
        article.headerImage = updateDTO.headerImage ?? article.headerImage
        article.status = updateDTO.status ?? article.status
        article.role = updateDTO.role ?? article.role
        article.publishDate = updateDTO.puclishDate ?? article.publishDate
        article.tags = updateDTO.tags ?? article.tags
        
        try await article.save(on: req.db)
        return article
    }
    
    static func delete(_ req: Vapor.Request, object: String) async throws -> Vapor.HTTPStatus {
        let uuid = try await getIDFromSlug(req, slug: object)
        
        guard let article = try await ArticleModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "Artigo com o ID \(uuid) não encontrado.")
        }
        
        try await article.delete(on: req.db)
        return .ok
    }
}

extension ArticleService: TransformProtocol {
    static func getIDFromSlug(_ req: Request, slug: String) async throws -> UUID {
        guard let article = try await ArticleModel.query(on: req.db)
            .filter(\.$slug == slug)
            .first() else {
            throw Abort(.notFound, reason: "Não foi possível encontrar o artigo com slug \(slug)")
        }
        
        return article.id!
    }
    
    typealias answerWithID = UUID
}

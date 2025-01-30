//
//  CourseService.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 29/01/25.
//

import Foundation
import Vapor
import Fluent

struct CourseServices: ContentProtocol {
    typealias answer = CourseModel
    typealias model = CourseModel
    typealias request = Request
    typealias status = HTTPStatus
    typealias createDTO = CreateCourseDTO
    typealias updateDTO = UpdateCourseDTO
    
    
    static func create(_ req: Vapor.Request, createDTO: CreateCourseDTO, author: UserModel) async throws -> Vapor.HTTPStatus {
        let slug = createDTO.title?.replacingOccurrences(of: " ", with: "-")
        
        let course = CourseModel(title: createDTO.title,
                                 slug: slug,
                                 tags: createDTO.tags,
                                 description: createDTO.description,
                                 status: createDTO.status ?? StatusEnum.draft.rawValue,
                                 price: createDTO.price ?? PriceEnum.pro.rawValue,
                                 headerImage: createDTO.headerImage,
                                 article: createDTO.article,
                                 topHexColor: createDTO.topHexColor,
                                 bottomHexColor: createDTO.bottomHexColor,
                                 sylabys: createDTO.syllabus,
                                 assets: createDTO.assets,
                                 author: "",
                                 createdAt: Date(),
                                 updatedAt: Date(),
                                 publicshDate: createDTO.publishDate)
        
        try await course.save(on: req.db)
        
        return .ok
    }
    
    static func get(_ req: Vapor.Request, object: String) async throws -> CourseModel {
        guard let course = try await CourseModel.query(on: req.db)
            .filter(\.$slug == object)
            .first() else {
            throw Abort(.notFound, reason: "Não foi possível encontrar o curso com slug de \(object)")
        }
        
        return course
    }
    
    static func getAll(_ req: Vapor.Request) async throws -> [CourseModel] {
        return try await CourseModel.query(on: req.db)
            .all()
    }
    
    static func update(_ req: Vapor.Request, object: String, updateDTO: UpdateCourseDTO) async throws -> CourseModel {
        let uuid = try await getIDFromSlug(req, slug: object)
        
        guard let course = try await CourseModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "O usuário com 0 ID \(uuid)) não foi encontrado.")
        }
        
        course.title = updateDTO.title ?? course.title
        course.tags = updateDTO.tags ?? course.tags
        course.description = updateDTO.description ?? course.description
        course.status = updateDTO.status ?? course.status
        course.price = updateDTO.price ?? course.price
        course.headerImage = updateDTO.headerImage ?? course.headerImage
        course.article = updateDTO.article ?? course.article
        course.topHexColor = updateDTO.topHexColor ?? course.topHexColor
        course.bottomHexColor = updateDTO.bottomHexColor ?? course.bottomHexColor
        course.sylabus = updateDTO.syllabus ?? course.sylabus
        course.assets = updateDTO.assets ?? course.assets
        course.publicshDate = updateDTO.publishDate ?? course.publicshDate
        
        try await course.save(on: req.db)
        
        return course
        
    }
    
    static func delete(_ req: Vapor.Request, object: String) async throws -> Vapor.HTTPStatus {
        let uuid = try await getIDFromSlug(req, slug: object)
        
        guard let course = try await CourseModel.find(uuid, on: req.db) else {
            throw Abort(.notFound, reason: "O usuário com 0 ID \(uuid)) não foi encontrado.")
        }
        
        try await course.delete(on: req.db)
        
        return .ok
    }
    
}


extension CourseServices: TransformProtocol {
    typealias answerWithID = UUID
    
    static func getIDFromSlug(_ req: Vapor.Request, slug: String) async throws -> UUID {
        guard let course = try await CourseModel.query(on: req.db)
            .filter(\.$slug == slug)
            .first() else {
                throw Abort(.notFound, reason: "O ID do curso não pôde ser encontrado")
            }
        
        return course.id!
    }
}

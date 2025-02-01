//
//  ArticleDTO.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 31/01/25.
//

import Foundation
import Fluent
import Vapor

struct CreateArticleDTO: Content {
    let title: String?
    let excerp: String?
    let content: String?
    let guide: GuideModel.IDValue?
    let headerImage: URL?
    let status: StatusEnum.RawValue?
    let price: PriceEnum.RawValue?
    let role: ContentRoleEnum.RawValue?
    let puclishDate: Date?
    let tags: [String]?
}

struct UpdateArticleDTO: Content {
    let title: String?
    let excerp: String?
    let content: String?
    let guide: GuideModel.IDValue?
    let headerImage: URL?
    let status: StatusEnum.RawValue?
    let price: PriceEnum.RawValue?
    let role: ContentRoleEnum.RawValue?
    let puclishDate: Date?
    let tags: [String]?
}

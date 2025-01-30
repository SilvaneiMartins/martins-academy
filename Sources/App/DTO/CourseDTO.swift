//
//  CourseDTO.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 29/01/25.
//

import Foundation
import Vapor
import Fluent

struct CreateCourseDTO: Content {
    let title: String?
    let tags: [String]?
    let description: String?
    let status: StatusEnum.RawValue?
    let price: PriceEnum.RawValue?
    let headerImage: URL?
    let article: String?
    let topHexColor: String?
    let bottomHexColor: String?
    let syllabus: URL?
    let assets: URL?
    let publishDate: Date?
}

struct UpdateCourseDTO: Content {
    let title: String?
    let tags: [String]?
    let description: String?
    let status: StatusEnum.RawValue?
    let price: PriceEnum.RawValue?
    let headerImage: URL?
    let article: String?
    let topHexColor: String?
    let bottomHexColor: String?
    let syllabus: URL?
    let assets: URL?
    let publishDate: Date?
}

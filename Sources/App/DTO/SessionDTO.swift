//
//  SessionDTO.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 31/01/25.
//

import Foundation
import Fluent
import Vapor

struct CreateSessionDTO: Content {
    let title: String?
    let mp4URL: URL?
    let h1sURL: URL?
    let publishDate: Date?
    let status: StatusEnum.RawValue?
    let price: PriceEnum.RawValue?
    let article: String?
    let course: CourseModel.IDValue?
}

struct UpdateSessionDTO: Content {
    let title: String?
    let mp4URL: URL?
    let h1sURL: URL?
    let publishDate: Date?
    let status: StatusEnum.RawValue?
    let price: PriceEnum.RawValue?	
    let article: String?
    let course: CourseModel.IDValue?
}

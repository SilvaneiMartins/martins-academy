//
//  GuideDTO.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 31/01/25.
//

import Foundation
import Fluent
import Vapor

struct CreateGuideDTO: Content {
    let title: String?
    let description: String?
    let headerImage: URL?
    let price: PriceEnum.RawValue?
    let status: StatusEnum.RawValue?
    let tags: [String]?
    let publishDate: Date?
}

struct UpdateGuideDTO: Content {
    let title: String?
    let description: String?
    let headerImage: URL?
    let price: PriceEnum.RawValue?
    let status: StatusEnum.RawValue?
    let tags: [String]?
    let publishDate: Date?
}

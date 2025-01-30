//
//  TransformProtocol.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 29/01/25.
//

import Foundation
import Vapor
import Fluent

protocol TransformProtocol {
    associatedtype answerWithID
    
    static func getIDFromSlug(_ req: Request, slug: String) async throws -> answerWithID
}

//
//  CRUDProtocols.swift
//  martins-academy
//
//  Created by Silvanei  Martins on 29/01/25.
//

import Foundation
import Vapor
import Fluent

protocol UserProtocol {
    associatedtype model
    associatedtype answer
    associatedtype request
    associatedtype createDTO
    associatedtype updateDTO
    associatedtype status
    
    static func create(_ req: request, _ createDTO: createDTO) async throws -> answer
    static func get(_ req: request, object: String) async throws -> answer
    static func update(_ req: request, object: String, updateDTO: updateDTO) async throws -> answer
    static func delete(_ req: request, object: String) async throws -> status
}

protocol UpdateUserProtocol {
    
}

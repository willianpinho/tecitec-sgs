//
//  Empresa.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Empresa: Model {
    static let entity = "empresas"
    
    let storage = Storage()
    
    /// The content of the empresas
    var email: String
    var name: String
    var perfil: Identifier?
    
    /// Creates a new Empresa
    init(email: String, name: String, perfil: Role) {
        self.email = email
        self.name = name
        self.perfil = perfil.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Empresa from the
    /// database row
    init(row: Row) throws {
        email = try row.get("email")
        name = try row.get("name")
        perfil = try row.get("perfil_id")
    }
    
    // Serializes the Empresa to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("email", email)
        try row.set("name", name)
        try row.set("perfil", perfil)
        
        return row
    }
}

// MARK: Fluent Preparation

extension Empresa: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Empresas
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("email")
            builder.string("name")
            builder.int("perfil_id")
            
        }
    }
    
    /// Undoes what was done in `prepare`
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

// MARK: JSON

// How the model converts from / to JSON.
// For example when:
//     - Creating a new Empresa (POST /empresass)
//     - Fetching a empresas (GET /empresass, GET /empresass/:id)
//
extension Empresa: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            email: json.get("email"),
            name: json.get("name"),
            perfil: json.get("perfil_id")
            
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("email", email)
        try json.set("name", name)
        try json.set("perfil", name)
        
        return json
    }
}

// MARK: HTTP

// This allows Empresa models totime
extension Empresa: ResponseRepresentable { }

extension Empresa: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

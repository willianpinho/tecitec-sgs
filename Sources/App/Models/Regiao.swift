//
//  Regiao.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Regiao: Model {
    static let entity = "regioes"
    
    let storage = Storage()
    
    /// The content of the regioes
    var email: String
    var name: String
    var role: Identifier?
    
    /// Creates a new Regiao
    init(email: String, name: String, role: Role) {
        self.email = email
        self.name = name
        self.role = role.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Regiao from the
    /// database row
    init(row: Row) throws {
        email = try row.get("email")
        name = try row.get("name")
        role = try row.get("role_id")
    }
    
    // Serializes the Regiao to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("email", email)
        try row.set("name", name)
        try row.set("role", role)
        
        return row
    }
}

// MARK: Fluent Preparation

extension Regiao: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Regiaos
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("email")
            builder.string("name")
            builder.int("role_id")
            
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
//     - Creating a new Regiao (POST /regioess)
//     - Fetching a regioes (GET /regioess, GET /regioess/:id)
//
extension Regiao: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            email: json.get("email"),
            name: json.get("name"),
            role: json.get("role_id")
            
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("email", email)
        try json.set("name", name)
        try json.set("role", name)
        
        return json
    }
}

// MARK: HTTP

// This allows Regiao models totime
extension Regiao: ResponseRepresentable { }

extension Regiao: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

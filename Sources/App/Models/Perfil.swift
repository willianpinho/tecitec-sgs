//
//  Perfil.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Perfil: Model {
    static let entity = "perfis"
    
    let storage = Storage()
    
    /// The content of the perfis
    var name: String
    
    /// Creates a new Perfil
    init(name: String) {
        self.name = name
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Perfil from the
    /// database row
    init(row: Row) throws {
        name = try row.get("name")
    }
    
    // Serializes the Perfil to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        
        return row
    }
}

// MARK: Fluent Preparation

extension Perfil: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Perfils
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("name")
            
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
//     - Creating a new Perfil (POST /perfiss)
//     - Fetching a perfis (GET /perfiss, GET /perfiss/:id)
//
extension Perfil: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            name: json.get("name")
            
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("name", name)
        
        return json
    }
}

// MARK: HTTP

// This allows Perfil models totime
extension Perfil: ResponseRepresentable { }

extension Perfil: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

//
//  Material.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Material: Model {
    static let entity = "materiais"
    
    let storage = Storage()
    
    /// The content of the usuarios_tipo
    var nome: String
    
    /// Creates a new Material
    init(nome: String) {
        self.nome = nome
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Material from the
    /// database row
    init(row: Row) throws {
        nome = try row.get("nome")
    }
    
    // Serializes the Material to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("nome", nome)
        
        return row
    }
}

// MARK: Fluent Preparation

extension Material: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Materials
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("nome")
            
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
//     - Creating a new Material (POST /usuarios_tipos)
//     - Fetching a usuarios_tipo (GET /usuarios_tipos, GET /usuarios_tipos/:id)
//
extension Material: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            nome: json.get("nome")
            
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("nome", nome)
        
        return json
    }
}

// MARK: HTTP

// This allows Material models totime
extension Material: ResponseRepresentable { }

extension Material: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

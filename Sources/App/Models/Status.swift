//
//  Status.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Status: Model {
    static let entity = "status"
    
    let storage = Storage()
    
    /// The content of the status
    var nome: String
    
    /// Creates a new Status
    init(nome: String) {
        self.nome = nome
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Status from the
    /// database row
    init(row: Row) throws {
        nome = try row.get("nome")
    }
    
    // Serializes the Status to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("nome", nome)
        
        return row
    }
}

// MARK: Fluent Preparation

extension Status: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Statuss
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
//     - Creating a new Status (POST /statuss)
//     - Fetching a status (GET /statuss, GET /statuss/:id)
//
extension Status: JSONConvertible {
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

// This allows Status models totime
extension Status: ResponseRepresentable { }

extension Status: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

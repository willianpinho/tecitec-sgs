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
    var nome: String
    
    /// Creates a new Regiao
    init(nome: String) {
        self.nome = nome
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Regiao from the
    /// database row
    init(row: Row) throws {
        nome = try row.get("nome")
    }
    
    // Serializes the Regiao to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("nome", nome)
        
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
//     - Creating a new Regiao (POST /regioess)
//     - Fetching a regioes (GET /regioess, GET /regioess/:id)
//
extension Regiao: JSONConvertible {
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

// This allows Regiao models totime
extension Regiao: ResponseRepresentable { }

extension Regiao: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

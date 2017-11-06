//
//  Item.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Item: Model {
    static let entity = "itens"
    
    let storage = Storage()
    
    /// The content of the itens
    var nome: String
    
    /// Creates a new Item
    init(nome: String) {
        self.nome = nome
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Item from the
    /// database row
    init(row: Row) throws {
        nome = try row.get("nome")
    }
    
    // Serializes the Item to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("nome", nome)
        
        return row
    }
}

// MARK: Fluent Preparation

extension Item: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Items
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
//     - Creating a new Item (POST /itenss)
//     - Fetching a itens (GET /itenss, GET /itenss/:id)
//
extension Item: JSONConvertible {
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

// This allows Item models totime
extension Item: ResponseRepresentable { }

extension Item: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

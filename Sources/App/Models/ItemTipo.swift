//
//  ItemTipo.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class ItemTipo: Model {
    static let entity = "item_tipos"
    
    let storage = Storage()
    
    /// The content of the itens
    var nome: String
    
    /// Creates a new ItemTipo
    init(nome: String) {
        self.nome = nome
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the ItemTipo from the
    /// database row
    init(row: Row) throws {
        nome = try row.get("nome")
    }
    
    // Serializes the ItemTipo to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("nome", nome)
        
        return row
    }
}

// MARK: Fluent Preparation

extension ItemTipo: Preparation {
    /// Prepares a table/collection in the database
    /// for storing ItemTipos
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
//     - Creating a new ItemTipo (POST /itenss)
//     - Fetching a itens (GET /itenss, GET /itenss/:id)
//
extension ItemTipo: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            nome: json.get("nome"   )
            
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

// This allows ItemTipo models totime
extension ItemTipo: ResponseRepresentable { }

extension ItemTipo: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

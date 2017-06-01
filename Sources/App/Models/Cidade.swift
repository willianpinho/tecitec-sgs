//
//  Cidade.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Cidade: Model {
    static let entity = "cidades"
    
    let storage = Storage()
    
    /// The content of the cidades
    var regiao: Identifier?
    var nome: String
    
    /// Creates a new Cidade
    init(regiao: Regiao, nome: String) {
        self.regiao = regiao.id
        self.nome = nome
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Cidade from the
    /// database row
    init(row: Row) throws {
        regiao = try row.get("regiao_id")
        nome = try row.get("nome")
    }
    
    // Serializes the Cidade to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("regiao_id", regiao)
        try row.set("nome", nome)

        return row
    }
}

// MARK: Fluent Preparation

extension Cidade: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Cidades
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.int("regiao_id")
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
//     - Creating a new Cidade (POST /cidadess)
//     - Fetching a cidades (GET /cidadess, GET /cidadess/:id)
//
extension Cidade: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            nome: json.get("regiao_id"),
            nome: json.get("nome")

            
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("regiao_id", regiao)
        try json.set("nome", nome)
        
        return json
    }
}

// MARK: HTTP

// This allows Cidade models totime
extension Cidade: ResponseRepresentable { }

extension Cidade: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

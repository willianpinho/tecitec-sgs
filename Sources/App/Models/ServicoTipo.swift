//
//  ServicoTipo.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class ServicoTipo: Model {
    static let entity = "servico_tipos"
    
    let storage = Storage()
    
    /// The content of the servicos_tipo
    var nome: String
    var descricao: String
    
    /// Creates a new ServicoTipo
    init(nome: String, descricao: String) {
        self.nome = nome
        self.descricao = descricao
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the ServicoTipo from the
    /// database row
    init(row: Row) throws {
        nome = try row.get("nome")
        descricao = try row.get("descricao")

    }
    
    // Serializes the ServicoTipo to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("nome", nome)
        try row.set("descricao", descricao)

        
        return row
    }
}

// MARK: Fluent Preparation

extension ServicoTipo: Preparation {
    /// Prepares a table/collection in the database
    /// for storing ServicoTipos
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("nome")
            builder.custom("descricao", type: "TEXT")

            
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
//     - Creating a new ServicoTipo (POST /servicos_tipos)
//     - Fetching a servicos_tipo (GET /servicos_tipos, GET /servicos_tipos/:id)
//
extension ServicoTipo: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            nome: json.get("nome"),
            descricao: json.get("descricao")

            
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("nome", nome)
        try json.set("descricao", descricao)

        
        return json
    }
}

// MARK: HTTP

// This allows ServicoTipo models totime
extension ServicoTipo: ResponseRepresentable { }

extension ServicoTipo: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

//
//  Servico.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Servico: Model {
    static let entity = "servicos"
    
    let storage = Storage()
    
    /// The content of the servicos
    var tipoServico: Identifier?
    var item: Identifier?
    var custo: Double
    var preco: Double
    
    /// Creates a new Servico
    init(tipoServico: ServicoTipo, item: Item, custo: Double, preco: Double) {
        self.tipoServico = tipoServico.id
        self.item = item.id
        self.custo = custo
        self.preco = preco
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Servico from the
    /// database row
    init(row: Row) throws {
        tipoServico = try row.get("tipo_servico_id")
        item = try row.get("item_id")
        custo = try row.get("custo")
        preco = try row.get("preco")

    }
    
    // Serializes the Servico to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("tipo_servico_id", tipoServico)
        try row.set("item_id", item)
        try row.set("custo", custo)
        try row.set("preco", preco)

        return row
    }
}

// MARK: Fluent Preparation

extension Servico: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Servicos
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.int("tipo_servico_id")
            builder.int("item_id")
            builder.double("custo")
            builder.double("preco")

            
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
//     - Creating a new Servico (POST /servicoss)
//     - Fetching a servicos (GET /servicoss, GET /servicoss/:id)
//
extension Servico: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            tipoServico: json.get("tipo_servico_id"),
            item: json.get("item_id"),
            custo: json.get("custo"),
            preco: json.get("preco")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("tipo_servico_id", tipoServico)
        try json.set("item_id", item)
        try json.set("custo", custo)
        try json.set("preco", preco)

        return json
    }
}

// MARK: HTTP

// This allows Servico models totime
extension Servico: ResponseRepresentable { }

extension Servico: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

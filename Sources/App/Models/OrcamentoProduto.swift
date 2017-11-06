//
//  OrcamentoItem.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class OrcamentoProduto: Model {
    static let entity = "orcamento_produtos"
    
    let storage = Storage()
    
    /// The content of the itens
    var orcamento: Identifier?
    var produto: Identifier?
    
    /// Creates a new OrcamentoItem
    init(orcamento: Orcamento, produto: Produto) {
        self.orcamento = orcamento.id
        self.produto = produto.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the OrcamentoItem from the
    /// database row
    init(row: Row) throws {
        orcamento = try row.get("orcamento_id")
        produto = try row.get("produto_id")

    }
    
    // Serializes the OrcamentoItem to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("orcamento_id", orcamento)
        try row.set("produto_id", produto)

        return row
    }
}

// MARK: Fluent Preparation

extension OrcamentoProduto: Preparation {
    /// Prepares a table/collection in the database
    /// for storing OrcamentoItems
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.int("orcamento_id")
            builder.int("produto_id")
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
//     - Creating a new OrcamentoItem (POST /itenss)
//     - Fetching a itens (GET /itenss, GET /itenss/:id)
//
extension OrcamentoProduto: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            orcamento: json.get("orcamento_id"),
            produto: json.get("produto_id")
            
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("orcamento_id", orcamento)
        try json.set("produto_id", produto)

        return json
    }
}

// MARK: HTTP

// This allows OrcamentoItem models totime
extension OrcamentoProduto: ResponseRepresentable { }

extension OrcamentoProduto: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

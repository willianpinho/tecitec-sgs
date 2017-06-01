//
//  Orcamento.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Orcamento: Model {
    static let entity = "orcamentos"
    
    let storage = Storage()
    
    /// The content of the Orcamentos
    var codigo: String
    var atendente: Identifier?
    var cliente: Identifier?
    var vendedor: String
    var empresa: Identifier?
    var observacoes: String
    
    /// Creates a new Orcamento
    init(codigo: String, atendente: Usuario, cliente: Usuario, vendedor: String, empresa: Empresa, observacoes: String) {
        self.codigo = codigo
        self.atendente = atendente.id
        self.cliente = cliente.id
        self.vendedor = vendedor
        self.empresa = empresa.id
        self.observacoes = observacoes
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Orcamento from the
    /// database row
    init(row: Row) throws {
        codigo = try row.get("codigo")
        atendente= try row.get("atendente_id")
        cliente = try row.get("cliente_id")
        vendedor = try row.get("vendedor")
        empresa = try row.get("empresa_id")
        observacoes = try row.get("observacoes")

    }
    
    // Serializes the Orcamento to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("codigo", codigo)
        try row.set("atendente_id", atendente)
        try row.set("cliente_id", cliente)
        try row.set("vendedor", vendedor)
        try row.set("empresa_id", empresa)
        try row.set("observacoes", observacoes)

        return row
    }
}

// MARK: Fluent Preparation

extension Orcamento: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Orcamentos
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("codigo")
            builder.int("atendente_id")
            builder.int("cliente_id")
            builder.string("vendedor")
            builder.int("empresa_id")
            builder.string("observacoes")

            
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
//     - Creating a new Orcamento (POST /Orcamentoss)
//     - Fetching a Orcamentos (GET /Orcamentoss, GET /Orcamentoss/:id)
//
extension Orcamento: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            codigo: json.get("codigo"),
            atendente: json.get("atendente_id"),
            cliente: json.get("cliente_id"),
            vendedor: json.get("vendedor"),
            empresa: json.get("empresa_id"),
            observacoes: json.get("observacoes")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("codigo", codigo)
        try json.set("atendente_id", atendente)
        try json.set("cliente_id", cliente)
        try json.set("vendedor", vendedor)
        try json.set("empresa_id", empresa)
        try json.set("observacoes", observacoes)

        return json
    }
}

// MARK: HTTP

// This allows Orcamento models totime
extension Orcamento: ResponseRepresentable { }

extension Orcamento: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

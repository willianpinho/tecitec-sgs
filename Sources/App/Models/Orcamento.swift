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
    var atendente: Identifier?
    var cliente: Identifier?
    var empresa: Identifier?
    var observacoes: String
    var valor: Double?
    var desconto: Double?
    var status: Identifier?
    
    /// Creates a new Orcamento
    init(atendente: Usuario, cliente: Usuario, empresa: Empresa, observacoes: String, valor: Double, desconto: Double, status: Status) {
        self.atendente = atendente.id
        self.cliente = cliente.id
        self.empresa = empresa.id
        self.observacoes = observacoes
        self.valor = valor
        self.desconto = desconto
        self.status = status.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Orcamento from the
    /// database row
    init(row: Row) throws {
        atendente = try row.get("atendente_id")
        cliente = try row.get("cliente_id")
        empresa = try row.get("empresa_id")
        observacoes = try row.get("observacoes")
        valor = try row.get("valor")
        desconto = try row.get("desconto")
        status = try row.get("status_id")
    }
    
    // Serializes the Orcamento to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("atendente_id", atendente)
        try row.set("cliente_id", cliente)
        try row.set("empresa_id", empresa)
        try row.set("observacoes", observacoes)
        try row.set("valor", valor)
        try row.set("desconto", desconto)
        try row.set("status_id", status)

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
            builder.int("atendente_id")
            builder.int("cliente_id")
            builder.int("empresa_id")
            builder.string("observacoes")
            builder.double("valor", optional: true)
            builder.double("desconto", optional: true)
            builder.int("status_id")
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
            atendente: json.get("atendente_id"),
            cliente: json.get("cliente_id"),
            empresa: json.get("empresa_id"),
            observacoes: json.get("observacoes"),
            valor: json.get("valor"),
            desconto: json.get("desconto"),
            status: json.get("status_id")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        let atendenteObject = try Usuario.find(atendente)?.makeJSON()
        try json.set("atendente", atendenteObject)
        let clienteObject = try Usuario.find(cliente)?.makeJSON()
        try json.set("cliente", clienteObject)
        let empresaObject = try Empresa.find(empresa)?.makeJSON()
        try json.set("empresa", empresaObject)
        try json.set("observacoes", observacoes)
        try json.set("valor", valor)
        try json.set("desconto", desconto)
        let statusObject = try Status.find(status)?.makeJSON()
        try json.set("status", statusObject)

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

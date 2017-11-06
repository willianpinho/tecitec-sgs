//
//  Empresa.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Empresa: Model {
    static let entity = "empresas"
    
    let storage = Storage()
    
    /// The content of the empresas
    var nome: String
    var cnpj: String
    
    /// Creates a new Empresa
    init(nome: String, cnpj: String) {
        self.nome = nome
        self.cnpj = cnpj
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Empresa from the
    /// database row
    init(row: Row) throws {
        nome = try row.get("nome")
        cnpj = try row.get("cnpj")

    }
    
    // Serializes the Empresa to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("nome", nome)
        try row.set("cnpj", cnpj)

        
        return row
    }
}

// MARK: Fluent Preparation

extension Empresa: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Empresas
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("nome")
            builder.string("cnpj")

            
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
//     - Creating a new Empresa (POST /empresass)
//     - Fetching a empresas (GET /empresass, GET /empresass/:id)
//
extension Empresa: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            nome: json.get("nome"),
            cnpj: json.get("cnpj")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("nome", nome)
        try json.set("cnpj", cnpj)

        return json
    }
}

// MARK: HTTP

// This allows Empresa models totime
extension Empresa: ResponseRepresentable { }

extension Empresa: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

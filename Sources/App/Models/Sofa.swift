//
//  Sofa.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Sofa: Model {
    static let entity = "sofas"
    
    let storage = Storage()
    
    /// The content of the itens
    var tipoItem: Identifier?
    var largura: String
    var altura: String
    var comprimento: String
    var quantidadeLugares: Int
    var material: Identifier?
    
    /// Creates a new Sofa
    init(tipoItem: ItemTipo, largura: String, altura: String, comprimento: String, quantidadeLugares: Int, material: Material) {
        self.tipoItem = tipoItem.id
        self.largura = largura
        self.altura = altura
        self.comprimento = comprimento
        self.quantidadeLugares = quantidadeLugares
        self.material = material.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Sofa from the
    /// database row
    init(row: Row) throws {
        tipoItem = try row.get("item_tipo_id")
        largura = try row.get("largura")
        altura = try row.get("altura")
        comprimento = try row.get("comprimento")
        quantidadeLugares = try row.get("quantidade_lugares")
        material = try row.get("material_id")

    }
    
    // Serializes the Sofa to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("item_tipo_id", tipoItem)
        try row.set("largura", largura)
        try row.set("altura", altura)
        try row.set("comprimento", comprimento)
        try row.set("quantidade_lugares", quantidadeLugares)
        try row.set("material_id", material)

        
        return row
    }
}

// MARK: Fluent Preparation

extension Sofa: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Sofas
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.int("item_tipo_id")
            builder.string("largura")
            builder.string("altura")
            builder.string("comprimento")
            builder.int("quantidade_lugares")
            builder.int("material_id")

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
//     - Creating a new Sofa (POST /itenss)
//     - Fetching a itens (GET /itenss, GET /itenss/:id)
//
extension Sofa: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            tipoItem: json.get("item_tipo_id"),
            largura: json.get("largura"),
            altura: json.get("altura"),
            comprimento: json.get("comprimento"),
            quantidadeLugares: json.get("quantidade_lugares"),
            material: json.get("material_id")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("item_tipo_id", tipoItem)
        try json.set("largura", largura)
        try json.set("altura", altura)
        try json.set("comprimento", comprimento)
        try json.set("quantidade_lugares", quantidadeLugares)
        try json.set("material_id", material)


        return json
    }
}

// MARK: HTTP

// This allows Sofa models totime
extension Sofa: ResponseRepresentable { }

extension Sofa: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

//
//  Poltrona.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Poltrona: Model {
    static let entity = "poltronas"
    
    let storage = Storage()
    
    /// The content of the itens
    var tipoItem: Identifier?
    var largura: String
    var altura: String
    var comprimento: String
    var material: Identifier?
    
    /// Creates a new Poltrona
    init(tipoItem: ItemTipo, largura: String, altura: String, comprimento: String, material: Material) {
        self.tipoItem = tipoItem.id
        self.largura = largura
        self.altura = altura
        self.comprimento = comprimento
        self.material = material.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Poltrona from the
    /// database row
    init(row: Row) throws {
        tipoItem = try row.get("item_tipo_id")
        largura = try row.get("largura")
        altura = try row.get("altura")
        comprimento = try row.get("comprimento")
        material = try row.get("material_id")
        
    }
    
    // Serializes the Poltrona to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("item_tipo_id", tipoItem)
        try row.set("largura", largura)
        try row.set("altura", altura)
        try row.set("comprimento", comprimento)
        try row.set("material_id", material)
        
        
        return row
    }
}

// MARK: Fluent Preparation

extension Poltrona: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Poltronas
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.int("item_tipo_id")
            builder.string("largura")
            builder.string("altura")
            builder.string("comprimento")
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
//     - Creating a new Poltrona (POST /itenss)
//     - Fetching a itens (GET /itenss, GET /itenss/:id)
//
extension Poltrona: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            tipoItem: json.get("item_tipo_id"),
            largura: json.get("largura"),
            altura: json.get("altura"),
            comprimento: json.get("comprimento"),
            material: json.get("material_id")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("largura", largura)
        try json.set("altura", altura)
        try json.set("comprimento", comprimento)
        let currentItemTipo = try ItemTipo.makeQuery().filter("id", tipoItem?.int).first()?.makeJSON()
        try json.set("item_tipo", currentItemTipo)
        let currentMaterial = try Material.makeQuery().filter("id", material?.int).first()?.makeJSON()
        try json.set("material", currentMaterial)
        
        return json
    }
}

// MARK: HTTP

// This allows Poltrona models totime
extension Poltrona: ResponseRepresentable { }

extension Poltrona: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

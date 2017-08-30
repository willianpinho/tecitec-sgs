//
//  CarroBanco.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class CarroBanco: Model {
    static let entity = "carro_bancos"
    
    let storage = Storage()
    
    /// The content of the itens
    var tipoItem: Identifier?
    var carro: Identifier?
    var material: Identifier?
    
    /// Creates a new CarroBanco
    init(tipoItem: ItemTipo, carro: Carro, material: Material) {
        self.tipoItem = tipoItem.id
        self.carro = carro.id
        self.material = material.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the CarroBanco from the
    /// database row
    init(row: Row) throws {
        tipoItem = try row.get("item_tipo_id")
        carro = try row.get("carro_id")
        material = try row.get("material_id")
        
    }
    
    // Serializes the CarroBanco to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("item_tipo_id", tipoItem)
        try row.set("carro_id", carro)
        try row.set("material_id", material)
        
        
        return row
    }
}

// MARK: Fluent Preparation

extension CarroBanco: Preparation {
    /// Prepares a table/collection in the database
    /// for storing CarroBancos
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.int("item_tipo_id")
            builder.int("carro_id")
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
//     - Creating a new CarroBanco (POST /itenss)
//     - Fetching a itens (GET /itenss, GET /itenss/:id)
//
extension CarroBanco: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            tipoItem: json.get("item_tipo_id"),
            carro: json.get("carro_id"),
            material: json.get("material_id")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        let currentItemTipo = try ItemTipo.makeQuery().filter("id", tipoItem?.int).first()?.makeJSON()
        try json.set("item_tipo", currentItemTipo)
        let currentCarro = try Carro.makeQuery().filter("id", carro?.int).first()?.makeJSON()
        try json.set("carro", currentCarro)
        let currentMaterial = try Material.makeQuery().filter("id", material?.int).first()?.makeJSON()
        try json.set("material", currentMaterial)
        
        return json
    }
}

// MARK: HTTP

// This allows CarroBanco models totime
extension CarroBanco: ResponseRepresentable { }

extension CarroBanco: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

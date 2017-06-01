//
//  Usuario.swift
//  Tecitec
//
//  Created by Willian Pinho on 5/30/17.
//
//

import Vapor
import FluentProvider
import HTTP

final class Usuario: Model {
    static let entity = "usuarios"
    
    let storage = Storage()
    
    /// The content of the usuarios
    var codigo: String
    var documento: String
    var endereco: String
    var complemento: String
    var cep: String
    var email: String
    var regiao: Identifier?
    var celular: String
    var telefone: String
    var genero: String
    var dataNascimento: String
    var observacoes: String
    var tipo: Identifier?
    var perfil: Identifier?
    var senha: String
    var status: Identifier?
    
    /// Creates a new Usuario
    init(codigo: String, documento: String, endereco: String, complemento: String, cep: String, email: String, regiao: Regiao, celular: String, telefone: String, genero: String, dataNascimento: String, observacoes: String, tipo: UsuarioTipo, perfil: Perfil, senha: String, status: Status) {
        self.codigo = codigo
        self.documento = documento
        self.endereco = endereco
        self.complemento = complemento
        self.cep = cep
        self.email = email
        self.regiao = regiao.id
        self.celular = celular
        self.telefone = telefone
        self.genero = genero
        self.dataNascimento = dataNascimento
        self.observacoes = observacoes
        self.tipo = tipo.id
        self.perfil = perfil.id
        self.senha = senha
        self.status = status.id
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Usuario from the
    /// database row
    init(row: Row) throws {
        codigo = try row.get("codigo")
        documento = try row.get("documento")
        endereco = try row.get("endereco")
        complemento = try row.get("complemento")
        cep = try row.get("cep")
        email = try row.get("email")
        regiao = try row.get("regiao_id")
        celular = try row.get("celular")
        telefone = try row.get("telefone")
        genero = try row.get("genero")
        dataNascimento = try row.get("data_nascimento")
        observacoes = try row.get("observacoes")
        tipo = try row.get("tipo_id")
        perfil = try row.get("perfil_id")
        senha = try row.get("senha")
        status = try row.get("status_id")
    }
    
    // Serializes the Usuario to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("codigo", codigo)
        try row.set("documento", documento)
        try row.set("endereco", endereco)
        try row.set("complemento", complemento)
        try row.set("cep", cep)
        try row.set("email", email)
        try row.set("regiao_id", regiao)
        try row.set("celular", celular)
        try row.set("telefone", telefone)
        try row.set("genero", genero)
        try row.set("data_nascimento", dataNascimento)
        try row.set("observacoes", observacoes)
        try row.set("tipo_id", tipo)
        try row.set("perfil_id", perfil)
        try row.set("senha", senha)
        try row.set("status_id", status)

        return row
    }
}

// MARK: Fluent Preparation

extension Usuario: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Usuarios
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string("codigo")
            builder.string("documento")
            builder.string("endereco")
            builder.custom("complemento", type: "TEXT")
            builder.string("cep")
            builder.string("email")
            builder.int("regiao_id")
            builder.string("celular")
            builder.string("telefone")
            builder.string("genero")
            builder.string("data_nascimento")
            builder.custom("observacoes", type: "TEXT")
            builder.int("tipo_id")
            builder.int("perfil_id")
            builder.string("senha")
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
//     - Creating a new Usuario (POST /usuarioss)
//     - Fetching a usuarios (GET /usuarioss, GET /usuarioss/:id)
//
extension Usuario: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            codigo: json.get("codigo"),
            documento: json.get("documento"),
            endereco: json.get("endereco"),
            complemento: json.get("complemento"),
            cep: json.get("cep"),
            email: json.get("email"),
            regiao: json.get("regiao_id"),
            celular: json.get("celular"),
            telefone: json.get("telefone"),
            genero: json.get("genero"),
            dataNascimento: json.get("data_nascimento"),
            observacoes: json.get("observacoes"),
            tipo: json.get("tipo_id"),
            perfil: json.get("perfil_id"),
            senha: json.get("senha"),
            status: json.get("status_id")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", id)
        try json.set("codigo", codigo)
        try json.set("documento", documento)
        try json.set("endereco", endereco)
        try json.set("complemento", complemento)
        try json.set("cep", cep)
        try json.set("email", email)
        try json.set("regiao_id", regiao)
        try json.set("celular", celular)
        try json.set("telefone", telefone)
        try json.set("genero", genero)
        try json.set("data_nascimento", dataNascimento)
        try json.set("observacoes", observacoes)
        try json.set("tipo_id", tipo)
        try json.set("perfil_id", perfil)
        try json.set("senha", senha)
        try json.set("status_id", status)

        return json
    }
}

// MARK: HTTP

// This allows Usuario models totime
extension Usuario: ResponseRepresentable { }

extension Usuario: Timestampable {
    static var updatedAtKey: String { return "updated_at" }
    static var createdAtKey: String { return "created_at" }
}

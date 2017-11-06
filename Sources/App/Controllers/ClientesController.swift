//
//  ClientesController.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import HTTP

final class ClientesController: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func addRoutes(drop: Droplet) {
        drop.get("clientes", handler: showClientes)
        drop.get("clientes/adicionar", handler: adicionarClientes)
        drop.post("clientes/adicionar", handler: addClientes)
        drop.get("clientes/:clienteId", handler: showClientesId)
        drop.get("clientes/:clienteId/editar", handler: editarClientesId)
        drop.post("clientes/:clienteId/editar", handler: editClientesId)
        drop.post("clientes/:clienteId/deletar", handler: deleteClientesId)
    }
    
    
    //MARK: Rotas de Clientes
    func showClientes(request: Request) throws -> ResponseRepresentable {
        let clientes = try Usuario.makeQuery().or({ (group) in
            try group.filter("tipo_id", 4)
            try group.filter("tipo_id", 5)
        }).all().makeJSON()
        
        let parameters = try Node(node: [
            "clientes": clientes
            ])
        
        return try view.make("clientes/clientes", parameters)
    }
    
    func adicionarClientes(request: Request) throws -> ResponseRepresentable {
        let tipos = try UsuarioTipo.makeQuery().or({ (group) in
            try group.filter("id", 4)
            try group.filter("id", 5)
        }).all().makeJSON()
        
        let cidades = try Cidade.makeQuery().all().makeJSON()
        
        let parameters = try Node(node: [
            "tipos": tipos,
            "cidades": cidades
            ])
        return try view.make("clientes/clientes_adicionar", parameters)
    }
    
    func addClientes(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let documento = request.data["documento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo documento")
        }
        
        guard let endereco = request.data["endereco"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo endereco")
            
        }
        
        guard let complemento = request.data["complemento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo complemento")
        }
        
        guard let cep = request.data["cep"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo cep")
        }
        
        guard let celular = request.data["celular"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo celular")
        }
        
        guard let telefone = request.data["telefone"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo telefone")
        }
        
        guard let dataNascimento = request.data["data_nascimento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo data nascimneto")
        }
        
        guard let observacoes = request.data["observacoes"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo observacoes")
        }
        
        guard let email = request.data["email"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo email")
        }
        
        guard let cidadeId = request.data["cidade_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo cidade")
        }
        
        guard let usuarioTipoId = request.data["tipo_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo tipo")
        }
        
        let cidade = try Cidade.find(cidadeId)
        let usuarioTipo = try UsuarioTipo.find(usuarioTipoId)
        let status = try Status.makeQuery().filter("nome", "Ativo").first()
        
        let cliente = Usuario(nome: nome, documento: documento, endereco: endereco, complemento: complemento, cidade: cidade!, cep: cep, celular: celular, telefone: telefone, dataNascimento: dataNascimento, observacoes: observacoes, tipo: usuarioTipo!, email: email, senha: "tecitec", status: status!)
        
        try cliente.save()
        
        return Response(redirect: "/clientes")
    }
    
    func showClientesId(request: Request) throws -> ResponseRepresentable {
        let clienteId = request.parameters["clienteId"]?.int
        let cliente = try Usuario.find(clienteId)?.makeJSON()
        let parameters = try Node(node: [
            "cliente": cliente
            ])
        return try view.make("clientes/clientes_id", parameters)
    }
    
    func editarClientesId(request: Request) throws -> ResponseRepresentable {
        let clienteId = request.parameters["clienteId"]?.int
        let cliente = try Usuario.find(clienteId)?.makeJSON()

        let tipos = try UsuarioTipo.makeQuery().or({ (group) in
            try group.filter("id", 4)
            try group.filter("id", 5)
        }).all().makeJSON()
        
        let cidades = try Cidade.makeQuery().all().makeJSON()
        
        let parameters = try Node(node: [
            "tipos": tipos,
            "cidades": cidades,
            "cliente": cliente
            ])
        
        return try view.make("clientes/clientes_id_editar", parameters)
    }
    
    func editClientesId(request: Request) throws -> ResponseRepresentable {
        let clienteId = request.parameters["clienteId"]?.int
        let cliente = try Usuario.find(clienteId)
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let documento = request.data["documento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo documento")
        }
        
        guard let endereco = request.data["endereco"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo endereco")
            
        }
        
        guard let complemento = request.data["complemento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo complemento")
        }
        
        guard let cep = request.data["cep"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo cep")
        }
        
        guard let celular = request.data["celular"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo celular")
        }
        
        guard let telefone = request.data["telefone"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo telefone")
        }
        
        guard let dataNascimento = request.data["data_nascimento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo data nascimneto")
        }
        
        guard let observacoes = request.data["observacoes"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo observacoes")
        }
        
        guard let email = request.data["email"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo email")
        }
        
        guard let cidadeId = request.data["cidade_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo cidade")
        }
        
        guard let usuarioTipoId = request.data["tipo_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo tipo")
        }
        
        let cidade = try Cidade.find(cidadeId)
        let usuarioTipo = try UsuarioTipo.find(usuarioTipoId)
        
        cliente?.nome = nome
        cliente?.documento = documento
        cliente?.endereco = endereco
        cliente?.complemento = complemento
        cliente?.cidade = cidade?.id
        cliente?.cep = cep
        cliente?.celular = celular
        cliente?.telefone = telefone
        cliente?.dataNascimento = dataNascimento
        cliente?.observacoes = observacoes
        cliente?.tipo = usuarioTipo?.id
        cliente?.email = email

        try cliente?.save()
        
        return Response(redirect: "/clientes/\(clienteId!)")
    }
    
    func deleteClientesId(request: Request) throws -> ResponseRepresentable {
        let clienteId = request.parameters["clienteId"]?.int

        let cliente = try Usuario.find(clienteId)
        try cliente?.delete()
        
        return Response(redirect: "/clientes")
    }
    
    
    /// When making a controller, it is pretty flexible in that it
    /// only expects closures, this is useful for advanced scenarios, but
    /// most of the time, it should look almost identical to this
    /// implementation
    func makeResource() -> Resource<String> {
        return Resource(
            index: showClientes
        )
    }
    
}
